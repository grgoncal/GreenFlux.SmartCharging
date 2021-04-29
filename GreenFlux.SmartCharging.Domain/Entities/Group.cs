using System;
using System.Collections.Generic;
using System.Text;

namespace GreenFlux.SmartCharging.Domain.Entities
{
    public class Group
    {
        public Group()
        {
        }

        public Group(long id)
        {
            Id = id;
        }

        public long Id { get; set; }
        public string Name { get; set; }
        public decimal CurrentCapacity { get; set; }
    }
}
