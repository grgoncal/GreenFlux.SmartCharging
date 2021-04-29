using System;
using System.Collections.Generic;
using System.Text;

namespace GreenFlux.SmartCharging.Domain.Entities
{
    public class ChargeStation
    {
        public ChargeStation()
        {
        }

        public ChargeStation(long id)
        {
            Id = id;
        }

        public long Id { get; set; }
        public string Name { get; set; }
        public long GroupId { get; set; }
    }
}
