using GreenFlux.SmartCharging.API.Application.Mediator.Commands.ChargeStations;
using GreenFlux.SmartCharging.API.Application.Mediator.Commands.Connectors;
using GreenFlux.SmartCharging.API.Application.Mediator.Commands.Groups;
using GreenFlux.SmartCharging.API.Controllers;
using GreenFlux.SmartCharging.Domain.Entities;
using GreenFlux.SmartCharging.Domain.Entities.Mediator.Base;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using NUnit.Framework;
using System;

namespace GreenFlux.SmartCharging.IntegratedTests
{
    public class ConnectorControllerTest
    {
        private GroupController _groupController;
        private ChargeStationController _chargeStationController;
        private ConnectorController _connectorController;
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

            _connectorController = new ConnectorController(_mediator);
            _connectorController.ControllerContext = IoC.SetControllerContext();
            _connectorController.Request.Scheme = "http";
        }

        [Test]
        public void When_GetAllGroups_Expect_AllGroups()
        {
            var actionResult = _connectorController.GetAllConnectors();

            var getResult = actionResult as OkObjectResult;

            Assert.AreEqual(200, getResult.StatusCode);
        }

        [Test]
        public void When_CreateConnector_Expect_ConnectorCreation()
        {
            var errorMessage = string.Empty;
            var createdGroup = CreateGroup();
            var createdChargeStation = CreateChargeStation(createdGroup);

            var createConnectorCommand = new CreateOrUpdateConnectorCommand() { Connector = new Connector() { MaxCurrent = 50, ChargeStationId = createdChargeStation.Id } };

            var actionResult = _connectorController.Create(createConnectorCommand);

            var createdConnector = ActionResultParser.ParseCreatedResult<Connector>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            Assert.AreNotEqual(0, createdConnector.Id);

            DeleteGroup(createdGroup);
        }

        [Test]
        public void When_CreateConnectorThatExceedsGroupCapacity_Expect_Error()
        {
            var errorMessage = string.Empty;
            var createdGroup = CreateGroup();
            var createdChargeStation = CreateChargeStation(createdGroup);

            var createConnectorCommand = new CreateOrUpdateConnectorCommand() { Connector = new Connector() { MaxCurrent = 101, ChargeStationId = createdChargeStation.Id } };

            var actionResult = _connectorController.Create(createConnectorCommand);

            DeleteGroup(createdGroup);

            _ = ActionResultParser.ParseObjectResult<Connector>(actionResult, out errorMessage);

            Assert.IsTrue(!string.IsNullOrEmpty(errorMessage));
        }

        [Test]
        public void When_SecondConnectorCreationExceedsGroupCapacity_Expect_SuggestedConnectorRemovals()
        {
            var errorMessage = string.Empty;
            var createdGroup = CreateGroup();
            var createdChargeStation = CreateChargeStation(createdGroup);

            var createConnectorCommand = new CreateOrUpdateConnectorCommand() { Connector = new Connector() { MaxCurrent = 60, ChargeStationId = createdChargeStation.Id } };
            var actionResult = _connectorController.Create(createConnectorCommand);
            var createdConnector1 = ActionResultParser.ParseCreatedResult<Connector>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            createConnectorCommand = new CreateOrUpdateConnectorCommand() { Connector = new Connector() { MaxCurrent = 50, ChargeStationId = createdChargeStation.Id } };
            actionResult = _connectorController.Create(createConnectorCommand);

            var createdResult = actionResult as ObjectResult;
            var createdResponse = createdResult.Value as Response;
            var createdConnector2Message = createdResponse.ErrorMessage;

            if (string.IsNullOrEmpty(createdResponse.ErrorMessage)) 
            {
                DeleteGroup(createdGroup);
                Assert.Fail();
            }

            Assert.IsTrue(createdConnector2Message.Contains(createdConnector1.Id.ToString()));
            DeleteGroup(createdGroup);
        }

        [Test]
        public void When_SecondConnectorUpdateExceedsGroupCapacity_Expect_SuggestedConnectorRemovals()
        {
            var errorMessage = string.Empty;
            var createdGroup = CreateGroup();
            var createdChargeStation = CreateChargeStation(createdGroup);

            var createConnectorCommand = new CreateOrUpdateConnectorCommand() { Connector = new Connector() { MaxCurrent = 60, ChargeStationId = createdChargeStation.Id } };
            var actionResult = _connectorController.Create(createConnectorCommand);
            var createdConnector1 = ActionResultParser.ParseCreatedResult<Connector>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            createConnectorCommand = new CreateOrUpdateConnectorCommand() { Connector = new Connector() { MaxCurrent = 30, ChargeStationId = createdChargeStation.Id } };
            actionResult = _connectorController.Create(createConnectorCommand);
            _ = ActionResultParser.ParseCreatedResult<Connector>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            createConnectorCommand.Connector.MaxCurrent = 50;
            actionResult = _connectorController.Update(createConnectorCommand);

            var createdResult = actionResult as ObjectResult;
            var createdResponse = createdResult.Value as Response;
            var createdConnector2Message = createdResponse.ErrorMessage;

            if (string.IsNullOrEmpty(createdResponse.ErrorMessage))
            {
                DeleteGroup(createdGroup);
                Assert.Fail();
            }

            Assert.IsTrue(createdConnector2Message.Contains(createdConnector1.Id.ToString()));
            DeleteGroup(createdGroup);
        }

        [Test]
        public void When_SecondConnectorUpdate_Expect_ConnectorUpdate()
        {
            var errorMessage = string.Empty;
            var createdGroup = CreateGroup();
            var createdChargeStation = CreateChargeStation(createdGroup);

            var createConnectorCommand = new CreateOrUpdateConnectorCommand() { Connector = new Connector() { MaxCurrent = 60, ChargeStationId = createdChargeStation.Id } };
            var actionResult = _connectorController.Create(createConnectorCommand);
            _ = ActionResultParser.ParseCreatedResult<Connector>(actionResult, out errorMessage);

            createConnectorCommand = new CreateOrUpdateConnectorCommand() { Connector = new Connector() { MaxCurrent = 30, ChargeStationId = createdChargeStation.Id } };
            actionResult = _connectorController.Create(createConnectorCommand);
            _ = ActionResultParser.ParseCreatedResult<Connector>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            createConnectorCommand.Connector.MaxCurrent = 35;
            actionResult = _connectorController.Update(createConnectorCommand);
            var updatedConnector = ActionResultParser.ParseObjectResult<Connector>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            Assert.AreEqual(createConnectorCommand.Connector.MaxCurrent, updatedConnector.MaxCurrent);
            DeleteGroup(createdGroup);
        }

        [Test]
        public void When_DeleteConnector_Expect_ConnectorDeletion()
        {
            var errorMessage = string.Empty;
            var createdGroup = CreateGroup();
            var createdChargeStation = CreateChargeStation(createdGroup);

            var createConnectorCommand = new CreateOrUpdateConnectorCommand() { Connector = new Connector() { MaxCurrent = 50, ChargeStationId = createdChargeStation.Id } };

            var actionResult = _connectorController.Create(createConnectorCommand);

            var createdConnector = ActionResultParser.ParseCreatedResult<Connector>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            actionResult = _connectorController.Delete(createdConnector.Id);

            var deletedConnector = ActionResultParser.ParseObjectResult<Connector>(actionResult, out errorMessage);
            CheckErrorMessage(errorMessage);

            Assert.AreEqual(createdConnector.Id, deletedConnector.Id);

            DeleteGroup(createdGroup);
        }

        private ChargeStation CreateChargeStation(Group group)
        {
            var errorMessage = string.Empty;
            var guid = Guid.NewGuid().ToString();
            var newChargeStationCommand = new CreateChargeStationCommand() { ChargeStation = new ChargeStation() { Name = guid, GroupId = group.Id } };

            var actionResult = _chargeStationController.Create(newChargeStationCommand);

            return ActionResultParser.ParseCreatedResult<ChargeStation>(actionResult, out errorMessage);
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
