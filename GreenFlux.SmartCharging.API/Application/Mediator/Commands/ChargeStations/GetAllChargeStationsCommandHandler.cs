using GreenFlux.SmartChargin.API.Application.Mediator.Base;
using GreenFlux.SmartCharging.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GreenFlux.SmartChargin.API.Application.Mediator.Commands.ChargeStations
{
    public class GetAllChargeStationsCommandHandler : AbstractRequesHandler<GetAllChargeStationsCommand>
    {
        private readonly IChargeStationRepository _chargeStationRepository;

        public GetAllChargeStationsCommandHandler(IChargeStationRepository chargeStationRepository)
        {
            _chargeStationRepository = chargeStationRepository;
        }

        internal override HandleResponse HandleIt(GetAllChargeStationsCommand request, CancellationToken cancellationToken)
        {
            // This would be paginated in a real application, I created it to make my life easier
            var chargeStationList = _chargeStationRepository.GetAllChargeStations();

            return new HandleResponse() { Content = chargeStationList };
        }
    }
}
