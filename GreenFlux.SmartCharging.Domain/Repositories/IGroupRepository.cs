using GreenFlux.SmartCharging.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace GreenFlux.SmartCharging.Domain.Repositories
{
    public interface IGroupRepository
    {
        void CreateGroup(Group group);
        Group GetGroupById(long groupId);
        void DeleteGroup(Group group);
        void UpdateGroup(Group group);
        List<Group> GetAllGroups();
    }
}
