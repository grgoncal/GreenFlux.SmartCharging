using GreenFlux.SmartChargin.API.Application.Mediator.Base;
using GreenFlux.SmartChargin.API.Application.Mediator.Commands.Connectors;
using GreenFlux.SmartCharging.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GreenFlux.SmartChargin.API.Application.Mediator.Commands.ChargeStations
{
    public class DeleteChargeStationCommandHandler : AbstractRequesHandler<DeleteChargeStationCommand>
    {
        private readonly IChargeStationRepository _chargeStationRepository;

        public DeleteChargeStationCommandHandler(IChargeStationRepository chargeStationRepository)
        {
            _chargeStationRepository = chargeStationRepository;
        }

        internal override HandleResponse HandleIt(DeleteChargeStationCommand request, CancellationToken cancellationToken)
        {
            var chargeStation = request.ChargeStation;

            _chargeStationRepository.DeleteChargeStation(chargeStation);

            return new HandleResponse() { Content = chargeStation };
        }
    }
}
