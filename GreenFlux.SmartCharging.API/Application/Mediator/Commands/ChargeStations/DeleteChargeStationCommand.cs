using GreenFlux.SmartCharging.Domain.Entities;
using GreenFlux.SmartCharging.Domain.Entities.Mediator.Base;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GreenFlux.SmartCharging.API.Application.Mediator.Commands.ChargeStations
{
    public class DeleteChargeStationCommand : IRequest<Response>
    {
        public ChargeStation ChargeStation { get; set; }
    }
}
