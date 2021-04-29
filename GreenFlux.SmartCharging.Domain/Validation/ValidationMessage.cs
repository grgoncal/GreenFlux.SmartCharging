using GreenFlux.SmartCharging.Domain.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace GreenFlux.SmartCharging.Domain.Validation
{
    public class ValidationMessage
    {
        public ValidationMessage(string message, ValidationLevel level)
        {
            Message = message;
            Level = level;
        }

        public string Message { get; set; }
        public ValidationLevel Level { get; set; }
    }

}
