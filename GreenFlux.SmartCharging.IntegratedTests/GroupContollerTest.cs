using GreenFlux.SmartCharging.API.Application.Mediator.Commands.Groups;
using GreenFlux.SmartCharging.API.Controllers;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using NUnit.Framework;
using GreenFlux.SmartCharging.Domain.Entities;
using System;
using System.Web.Http;
using System.Web.Http.Results;
using GreenFlux.SmartCharging.Domain.Repositories;

namespace GreenFlux.SmartCharging.IntegratedTests
{
    public class GroupContollerTest
    {
        private GroupController _groupController;
        private IMediator _mediator;

        [SetUp]
        public void Setup()
        {
            _mediator = IoC.GetMediator();
            _groupController = new GroupController(_mediator);
            _groupController.ControllerContext = IoC.SetControllerContext();
            _groupController.Request.Scheme = "http";
        }

        [Test]
        public void ShouldReturnAllGroupsWhenGetIsCalled()
        {
            var actionResult = _groupController.GetAllGroups();

            var getResult = actionResult as OkObjectResult;

            Assert.AreEqual(200, getResult.StatusCode);
        }

        [Test]
        public void When_CreateGroup_Expect_GroupCreation()
        {
            var guid = Guid.NewGuid().ToString();
            var newGroup = new CreateGroupCommand() { Group = new Group() { Name = guid, CurrentCapacity = 100.123M } };
           
            var actionResult = _groupController.Create(newGroup);

            var getResult = actionResult as CreatedResult;
            var getResultResponse = getResult.Value as GreenFlux.SmartCharging.Domain.Entities.Mediator.Base.Response;
            var createdGroup = getResultResponse.Content as Group;

            Assert.AreNotEqual(0, createdGroup.Id);

            DeleteCreatedGroup(createdGroup);
        }

        private void DeleteCreatedGroup(Group createdGroup)
        {
            var groupRepository = IoC.GetGroupRepository();
            groupRepository.DeleteGroup(createdGroup);
        }
    }
}