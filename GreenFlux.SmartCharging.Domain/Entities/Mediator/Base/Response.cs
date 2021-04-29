using System;
using System.Collections.Generic;
using System.Text;

namespace GreenFlux.SmartCharging.Domain.Entities.Mediator.Base
{
    public class Response
    {
        public long Id { get; set; }
        public object Content { get; set; }
        public string ErrorMessage { get; set; }
    }
}
