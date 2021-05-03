using GreenFlux.SmartCharging.API.Application.Mediator.Base;
using GreenFlux.SmartCharging.Domain;
using GreenFlux.SmartCharging.Domain.Entities;
using GreenFlux.SmartCharging.Domain.Repositories;
using GreenFlux.SmartCharging.Domain.Validation;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GreenFlux.SmartCharging.API.Application.Mediator.Commands.Connectors
{
    public class CreateOrUpdateConnectorCommandHandler : AbstractRequesHandler<CreateOrUpdateConnectorCommand>
    {
        private readonly IConnectorRepository _connectorRepository;
        private readonly IChargeStationRepository _chargeStationRepository;
        private readonly IGroupRepository _groupRepository;

        public CreateOrUpdateConnectorCommandHandler(IConnectorRepository connectorRepository, 
            IChargeStationRepository chargeStationRepository, 
            IGroupRepository groupRepository)
        {
            _connectorRepository = connectorRepository;
            _chargeStationRepository = chargeStationRepository;
            _groupRepository = groupRepository;
        }

        internal override HandleResponse HandleIt(CreateOrUpdateConnectorCommand request, CancellationToken cancellationToken)
        {
            var connector = request.Connector;

            var existingConnector = _connectorRepository.GetConnectorById(connector.Id);

            if (existingConnector.Id == 0)
            {
                RunValidations(connector);
                _connectorRepository.CreateConnector(connector);
            }
            else
            {
                RunValidations(connector, true);
                _connectorRepository.UpdateConnector(connector);
            }

            return new HandleResponse() { Content = connector };
        }

        private void RunValidations(Connector connector, bool isUpdate = false)
        {
            ValidateFields(connector);

            var chargeStation = _chargeStationRepository.GetChargeStationById(connector.ChargeStationId);
            var chargeStationList = _chargeStationRepository.GetChargeStationListByGroupId(chargeStation.GroupId);
            var connectionList = _connectorRepository.GetConnectorsByChargeStationIds(chargeStationList);
            var group = _groupRepository.GetGroupById(chargeStation.GroupId);

            if (!isUpdate)
                ValidateChargeStationQuantity(connectionList, connector);

            ValidateGroupCapacity(group, connectionList, connector);
        }

        private void ValidateFields(Connector connector)
        {
            if (connector.ChargeStationId <= 0)
                throw new RestException("Can't create/update a connector without a charge station");
            if (connector.MaxCurrent <= 0)
                throw new RestException("Can't create/update a connector with a max current equal/smaller than 0");
        }

        private void ValidateChargeStationQuantity(List<Connector> connectionList, Connector newConnector)
        {
            var pairConnectors = connectionList.Where(c => c.ChargeStationId == newConnector.ChargeStationId);

            if (pairConnectors.Count() >= 5)
                throw new RestException("Can't add any more connectors to this charge station");
        }

        private void ValidateGroupCapacity(Group group, List<Connector> connectionList, Connector newConnector)
        {
            var existingConnectorsCurrent = connectionList.Where(c => c.Id != newConnector.Id).Sum(c => c.MaxCurrent);

            if (group.CurrentCapacity < existingConnectorsCurrent + newConnector.MaxCurrent)
            {
                var freeCapacity = group.CurrentCapacity - existingConnectorsCurrent;
                var requiredCapacity = newConnector.MaxCurrent - freeCapacity;

                var possibleRemovals = GetPossibleRemovals(connectionList, newConnector, requiredCapacity);
                var calculatedRemovals = possibleRemovals.Select(c => c.Id).ToList();

                if (calculatedRemovals.Count == 0)
                    throw new RestException($"Group capacity exceeded. No removal suggestion found.");

                throw new RestException($"Group capacity exceeded. Suggested connectors to remove (id): {string.Join(",", calculatedRemovals)}");
            }
        }

        private List<Connector> GetPossibleRemovals(List<Connector> connectionList, Connector newConnector, decimal requiredCapacity)
        {
            var possibleRemovals = new List<Connector>();

            var exactRemovals = connectionList.Where(c => c.MaxCurrent == newConnector.MaxCurrent);
            possibleRemovals.AddRange(exactRemovals);

            if (possibleRemovals.Sum(c => c.MaxCurrent) <= requiredCapacity)
                foreach (var connector in connectionList.OrderByDescending(c => c.MaxCurrent).ToList())
                {
                    possibleRemovals.Add(connector);

                    if (possibleRemovals.Sum(c => c.MaxCurrent) >= requiredCapacity)
                        break;
                }

            return possibleRemovals;
        }
    }
}
