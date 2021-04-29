using System;
using System.Collections.Generic;
using System.Text;

namespace GreenFlux.SmartCharging.Domain.Validation
{
    public class RestException : Exception
    {
        public RestException() : base()
        {
            ValidationMessages = new List<ValidationMessage>();
        }

        public RestException(string errorMessage) : base(errorMessage)
        {
            ValidationMessages = new List<ValidationMessage>();
            AddValidationMessage(errorMessage);
        }

        private void AddValidationMessage(string errorMessage)
        {
            var validationMessage = new ValidationMessage(errorMessage, Enums.ValidationLevel.Error);
            ValidationMessages.Add(validationMessage);
        }

        public List<ValidationMessage> ValidationMessages { get; set; }
    }
}
