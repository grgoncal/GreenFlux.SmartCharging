using GreenFlux.SmartCharging.Domain.Entities.Mediator.Base;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GreenFlux.SmartCharging.Domain.Entities;

namespace GreenFlux.SmartCharging.API.Application.Mediator.Commands.Groups
{
    public class CreateGroupCommand : IRequest<Response>
    {
        public Group Group { get; set; }
    }
}
