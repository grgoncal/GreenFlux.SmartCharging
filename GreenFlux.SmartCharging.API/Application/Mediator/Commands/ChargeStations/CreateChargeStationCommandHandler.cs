using GreenFlux.SmartChargin.API.Application.Mediator.Base;
using GreenFlux.SmartCharging.Domain.Entities;
using GreenFlux.SmartCharging.Domain.Repositories;
using GreenFlux.SmartCharging.Domain.Validation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GreenFlux.SmartChargin.API.Application.Mediator.Commands.ChargeStations
{
    public class CreateChargeStationCommandHandler : AbstractRequesHandler<CreateChargeStationCommand>
    {
        private readonly IChargeStationRepository _chargeStationRepository;
        private readonly IGroupRepository _groupRepository;

        public CreateChargeStationCommandHandler(IChargeStationRepository chargeStationRepository,
             IGroupRepository groupRepository)
        {
            _chargeStationRepository = chargeStationRepository;
            _groupRepository = groupRepository;
        }

        internal override HandleResponse HandleIt(CreateChargeStationCommand request, CancellationToken cancellationToken)
        {
            var chargeStation = request.ChargeStation;

            RunValidations(chargeStation);

            _chargeStationRepository.CreateChargeStation(chargeStation);

            return new HandleResponse() { Content = chargeStation };
        }

        private void RunValidations(ChargeStation chargeStation)
        {
            VerifyChargeStationFields(chargeStation);
            VerifyParentGroupId(chargeStation);
        }

        private void VerifyChargeStationFields(ChargeStation chargeStation)
        {
            if (string.IsNullOrEmpty(chargeStation.Name))
                throw new RestException("Name is required for creating a charge station");

            if (chargeStation.GroupId < 0)
                throw new RestException("Name is required for creating a charge station");
        }
        private void VerifyParentGroupId(ChargeStation chargeStation)
        {
            var existentGroup = _groupRepository.GetGroupById(chargeStation.GroupId);
            if (existentGroup == null || existentGroup.Id == 0)
                throw new RestException("Parent Group not found");
        }
    }
}
