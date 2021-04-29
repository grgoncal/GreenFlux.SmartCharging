using System;
using System.Collections.Generic;
using System.Text;

namespace GreenFlux.SmartCharging.Domain.Entities
{
    public class Connector
    {
        public Connector()
        {
        }

        public Connector(long id)
        {
            Id = id;
        }

        public long Id { get; set; }
        public decimal MaxCurrent { get; set; }
        public long ChargeStationId { get; set; }
    }
}
