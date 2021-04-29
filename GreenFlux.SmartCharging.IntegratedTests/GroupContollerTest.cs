using GreenFlux.SmartCharging.API.Application.Mediator.Commands.Groups;
using GreenFlux.SmartCharging.API.Controllers;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using NUnit.Framework;
using GreenFlux.SmartCharging.Domain.Entities;
using System;
using System.Web.Http;
using System.Web.Http.Results;

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
        }

        [Test] 
        public void ShouldReturnAllGroupsWhenGetIsCalled()
        {
            var actionResult =  _groupController.GetAllGroups();
            
            var getResult = actionResult as OkObjectResult;

            Assert.AreEqual(200, getResult.StatusCode);
        }

        [Test]
        public void When_CreateGroup_Expect_GroupCreation()
        {
            var newGroup = new CreateGroupCommand() { Group = new Group() { } }
            var actionResult = _groupController.Create();

            var getResult = actionResult as OkObjectResult;

            Assert.AreEqual(200, getResult.StatusCode);
        }
    }
}