using GreenFlux.SmartCharging.API.Application.Mediator.Commands.ChargeStations;
using GreenFlux.SmartCharging.API.Application.Mediator.Commands.Groups;
using GreenFlux.SmartCharging.API.Controllers;
using GreenFlux.SmartCharging.Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using NUnit.Framework;
using System;

namespace GreenFlux.SmartCharging.IntegratedTests
{
    public class ChargeStationControllerTest
    {
        private GroupController _groupController;
        private ChargeStationController _chargeStationController;
        private IMediator _mediator;

        [SetUp]
        public void Setup()
        {
            _mediator = IoC.GetMediator();

            _groupController = new GroupController(_mediator);
            _groupController.ControllerContext = IoC.SetControllerContext();
            _groupController.Request.Scheme = "http";

            _chargeStationController = new ChargeStationController(_mediator);
            _chargeStationController.ControllerContext = IoC.SetControllerContext();
            _chargeStationController.Request.Scheme = "http";
        }

        [Test]
        public void When_GetAllChargeStations_Expect_AllChargeStations()
        {
            var actionResult = _chargeStationController.GetAllChargeStations();

            var getResult = actionResult as OkObjectResult;

            Assert.AreEqual(200, getResult.StatusCode);
        }

        [Test]
        public void When_CreateChargeStation_Expect_ChargeStationCreation()
        {
            var errorMessage = string.Empty;

            var createdGroup = CreateGroup();

            var guid = Guid.NewGuid().ToString();
            var newChargeStationCommand = new CreateChargeStationCommand() { ChargeStation = new ChargeStation() { Name = guid, GroupId = createdGroup.Id } };

            var actionResult = _chargeStationController.Create(newChargeStationCommand);

            var createdChargeStation = ActionResultParser.ParseCreatedResult<ChargeStation>(actionResult, out errorMessage);

            if (!string.IsNullOrEmpty(errorMessage))
                Assert.Fail();

            Assert.AreNotEqual(0, createdChargeStation.Id);

            DeleteGroup(createdGroup);
        }

        [Test]
        public void When_CreateChargeStationWithoutGroup_Expect_ErrorMessage()
        {
            var errorMessage = string.Empty;

            var guid = Guid.NewGuid().ToString();
            var newChargeStationCommand = new CreateChargeStationCommand() { ChargeStation = new ChargeStation() { Name = guid } };

            var actionResult = _chargeStationController.Create(newChargeStationCommand);

            _ = ActionResultParser.ParseObjectResult<ChargeStation>(actionResult, out errorMessage);

            if (errorMessage.Contains("Parent Group not found"))
                Assert.Pass();

            Assert.Fail();
        }

        [Test]
        public void When_DeleteChargeStation_Expect_ChargeStationDeletion()
        {
            var errorMessage = string.Empty;

            var createdGroup = CreateGroup();

            var guid = Guid.NewGuid().ToString();
            var newChargeStationCommand = new CreateChargeStationCommand() { ChargeStation = new ChargeStation() { Name = guid, GroupId = createdGroup.Id } };

            var actionResult = _chargeStationController.Create(newChargeStationCommand);

            var createdChargeStation = ActionResultParser.ParseCreatedResult<ChargeStation>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            actionResult = _chargeStationController.Delete(createdChargeStation.Id);

            var deletedChargeStation = ActionResultParser.ParseObjectResult<ChargeStation>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            Assert.AreEqual(createdChargeStation.Id, deletedChargeStation.Id);

            DeleteGroup(createdGroup);
        }

        [Test]
        public void When_UpdateChargeStation_Expect_ChargeStationUpdate()
        {
            var errorMessage = string.Empty;

            var createdGroup = CreateGroup();

            var guid = Guid.NewGuid().ToString();
            var newChargeStationCommand = new CreateChargeStationCommand() { ChargeStation = new ChargeStation() { Name = guid, GroupId = createdGroup.Id } };

            var actionResult = _chargeStationController.Create(newChargeStationCommand);

            var createdChargeStation = ActionResultParser.ParseCreatedResult<ChargeStation>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            var newGuid = Guid.NewGuid().ToString();
            var updateChargeStationCommand = new UpdateChargeStationCommand() { ChargeStation = new ChargeStation() { Id = createdChargeStation.Id, GroupId = createdChargeStation.GroupId, Name = newGuid } };
            actionResult = _chargeStationController.Update(updateChargeStationCommand);

            var updatedChargeStation = ActionResultParser.ParseOkObjectResult<ChargeStation>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            Assert.AreNotEqual(createdChargeStation.Name, updatedChargeStation.Name);

            DeleteGroup(createdGroup);
        }

        private Group CreateGroup()
        {
            var errorMessage = string.Empty;

            var guid = Guid.NewGuid().ToString();
            var newGroupCommand = new CreateGroupCommand() { Group = new Group() { Name = guid, CurrentCapacity = 100M } };

            var actionResult = _groupController.Create(newGroupCommand);

            return ActionResultParser.ParseCreatedResult<Group>(actionResult, out errorMessage);
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
