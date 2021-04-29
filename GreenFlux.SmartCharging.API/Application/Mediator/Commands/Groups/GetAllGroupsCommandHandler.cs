using GreenFlux.SmartChargin.API.Application.Mediator.Base;
using GreenFlux.SmartCharging.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace GreenFlux.SmartChargin.API.Application.Mediator.Commands.Groups
{
    public class GetAllGroupsCommandHandler : AbstractRequesHandler<GetAllGroupsCommand>
    {
        private readonly IGroupRepository _groupRepository;

        public GetAllGroupsCommandHandler(IGroupRepository groupRepository)
        {
            _groupRepository = groupRepository;
        }

        internal override HandleResponse HandleIt(GetAllGroupsCommand request, CancellationToken cancellationToken)
        {
            var groupList = _groupRepository.GetAllGroups();

            return new HandleResponse() { Content = groupList };
        }
    }
}
