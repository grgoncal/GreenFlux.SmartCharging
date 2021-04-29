using GreenFlux.SmartCharging.Domain.Entities.Mediator.Base;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GreenFlux.SmartChargin.API.Application.Mediator.Commands.Groups
{
    public class GetAllGroupsCommand : IRequest<Response>
    {
    }
}
