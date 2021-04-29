using GreenFlux.SmartChargin.API.Application.Mediator.Base;
using GreenFlux.SmartCharging.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GreenFlux.SmartChargin.API.Application.Mediator.Commands.Groups
{
    public class DeleteGroupCommandHandler : AbstractRequesHandler<DeleteGroupCommand>
    {
        private readonly IGroupRepository _groupRepository;

        public DeleteGroupCommandHandler(IGroupRepository groupRepository)
        {
            _groupRepository = groupRepository;
        }

        internal override HandleResponse HandleIt(DeleteGroupCommand request, CancellationToken cancellationToken)
        {
            var group = request.Group;

            _groupRepository.DeleteGroup(group);

            return new HandleResponse() { Content = group };
        }
    }
}
