using GreenFlux.SmartChargin.API.Application.Mediator.Base;
using GreenFlux.SmartCharging.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GreenFlux.SmartChargin.API.Application.Mediator.Commands.Groups
{
    public class CreateGroupCommandHandler : AbstractRequesHandler<CreateGroupCommand>
    {
        private readonly IGroupRepository _groupRepository;

        public CreateGroupCommandHandler(IGroupRepository groupRepository)
        {
            _groupRepository = groupRepository;
        }

        internal override HandleResponse HandleIt(CreateGroupCommand request, CancellationToken cancellationToken)
        {
            var group = request.Group;

            _groupRepository.CreateGroup(group);

            return new HandleResponse() { Content = group };
        }
    }
}
