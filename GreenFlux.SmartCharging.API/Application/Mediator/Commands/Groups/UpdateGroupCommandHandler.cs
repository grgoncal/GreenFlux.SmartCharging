using GreenFlux.SmartCharging.API.Application.Mediator.Base;
using GreenFlux.SmartCharging.API.Application.Mediator.Commands.Connectors;
using GreenFlux.SmartCharging.Domain.Repositories;
using GreenFlux.SmartCharging.Domain.Validation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GreenFlux.SmartCharging.API.Application.Mediator.Commands.Groups
{
    public class UpdateGroupCommandHandler : AbstractRequesHandler<UpdateGroupCommand>
    {
        private readonly IGroupRepository _groupRepository;
        private readonly IChargeStationRepository _chargeStationRepository;
        private readonly IConnectorRepository _connectorRepository;

        public UpdateGroupCommandHandler(IGroupRepository groupRepository,
            IChargeStationRepository chargeStationRepository,
            IConnectorRepository connectorRepository)
        {
            _groupRepository = groupRepository;
            _chargeStationRepository = chargeStationRepository;
            _connectorRepository = connectorRepository;
        }

        internal override HandleResponse HandleIt(UpdateGroupCommand request, CancellationToken cancellationToken)
        {
            var group = request.Group;

            var existingGroup = _groupRepository.GetGroupById(group.Id);

            if (existingGroup.Id == 0)
                throw new RestException("Group not found");

            var chargeStationList = _chargeStationRepository.GetChargeStationListByGroupId(group.Id);
            var connectionList = _connectorRepository.GetConnectorsByChargeStationIds(chargeStationList);

            var currentConsumption = connectionList.Sum(c => c.MaxCurrent);
            if (group.CurrentCapacity < currentConsumption)
                throw new RestException("New capacity can't sustain the existing connectors");

            _groupRepository.UpdateGroup(group);

            return new HandleResponse() { Content = group };
        }
    }
}
