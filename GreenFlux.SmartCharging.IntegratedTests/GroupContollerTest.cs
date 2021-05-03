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
using GreenFlux.SmartCharging.Domain.Entities.Mediator.Base;

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
        public void When_GetAllGroups_Expect_AllGroups()
        {
            var actionResult = _groupController.GetAllGroups();

            var getResult = actionResult as OkObjectResult;

            Assert.AreEqual(200, getResult.StatusCode);
        }

        [Test]
        public void When_CreateGroup_Expect_GroupCreation()
        {
            var errorMessage = string.Empty;
            var guid = Guid.NewGuid().ToString();
            var newGroupCommand = new CreateGroupCommand() { Group = new Group() { Name = guid, CurrentCapacity = 100M } };
           
            var actionResult = _groupController.Create(newGroupCommand);

            var createdGroup = ActionResultParser.ParseCreatedResult<Group>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            Assert.AreNotEqual(0, createdGroup.Id);

            DeleteGroup(createdGroup);
        }

        [Test]
        public void When_UpdateGroupName_Expect_GroupUpdate()
        {
            var errorMessage = string.Empty;
            var guid = Guid.NewGuid().ToString();
            var newGroupCommand = new CreateGroupCommand() { Group = new Group() { Name = guid, CurrentCapacity = 100M } };
            var actionResult = _groupController.Create(newGroupCommand);

            var createdGroup = ActionResultParser.ParseCreatedResult<Group>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            if (createdGroup.Id == 0)
                Assert.Fail();

            var newGuid = Guid.NewGuid().ToString();
            var groupUpdateCommand = new UpdateGroupCommand() { Group = new Group() { Id = createdGroup.Id, CurrentCapacity = createdGroup.CurrentCapacity, Name = newGuid } };
            actionResult = _groupController.Update(groupUpdateCommand);

            var updatedGroup = ActionResultParser.ParseOkObjectResult<Group>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            Assert.AreEqual(newGuid, updatedGroup.Name);

            DeleteGroup(updatedGroup);
        }

        [Test]
        public void When_DeleteGroup_Expect_GroupDeletion()
        {
            var errorMessage = string.Empty;
            var guid = Guid.NewGuid().ToString();
            var newGroup = new CreateGroupCommand() { Group = new Group() { Name = guid, CurrentCapacity = 100M } };
            var actionResult = _groupController.Create(newGroup);

            var createdGroup = ActionResultParser.ParseCreatedResult<Group>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            if (createdGroup.Id == 0)
                Assert.Fail();

            actionResult = _groupController.Delete(createdGroup.Id);

            var deletedGroup = ActionResultParser.ParseObjectResult<Group>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            Assert.AreEqual(createdGroup.Id, deletedGroup.Id);
        }

        private void DeleteGroup(Group createdGroup)
        {
            var groupRepository = IoC.GetGroupRepository();
            groupRepository.DeleteGroup(createdGroup);
        }

        private void CheckErrorMessage(string errorMessage)
        {
            if (!string.IsNullOrEmpty(errorMessage))
                Assert.Fail();
        }
    }
}