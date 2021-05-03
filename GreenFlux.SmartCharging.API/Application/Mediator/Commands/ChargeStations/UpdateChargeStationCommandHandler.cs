using GreenFlux.SmartCharging.API.Application.Mediator.Base;
using GreenFlux.SmartCharging.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GreenFlux.SmartCharging.API.Application.Mediator.Commands.ChargeStations
{
    public class UpdateChargeStationCommandHandler : AbstractRequesHandler<UpdateChargeStationCommand>
    {
        private readonly IChargeStationRepository _chargeStationRepository;

        public UpdateChargeStationCommandHandler(IChargeStationRepository chargeStationRepository)
        {
            _chargeStationRepository = chargeStationRepository;
        }

        internal override HandleResponse HandleIt(UpdateChargeStationCommand request, CancellationToken cancellationToken)
        {
            var chargeStation = request.ChargeStation;

            _chargeStationRepository.UpdateChargeStation
                
                (chargeStation);

            return new HandleResponse() { Content = chargeStation };
        }
    }
}
