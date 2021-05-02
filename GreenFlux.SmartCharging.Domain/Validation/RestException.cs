using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Security.Permissions;
using System.Text;

namespace GreenFlux.SmartCharging.Domain.Validation
{
    [Serializable]
    public class RestException : Exception
    {
        public List<ValidationMessage> ValidationMessages { get; set; }

        public RestException()
        {
            ValidationMessages = new List<ValidationMessage>();
        }

        public RestException(string message) : base(message)
        {
            ValidationMessages = new List<ValidationMessage>();
            AddValidationMessage(message);
        }

        public RestException(string message, Exception innerException) : base(message, innerException)
        {
            ValidationMessages = new List<ValidationMessage>();
            AddValidationMessage(message);
        }

        [SecurityPermissionAttribute(SecurityAction.Demand,  SerializationFormatter = true)]
        protected RestException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
            this.ValidationMessages = (List<ValidationMessage>)info.GetValue("ValidationMessages", typeof(List<ValidationMessage>));
        }

        private void AddValidationMessage(string errorMessage)
        {
            var validationMessage = new ValidationMessage(errorMessage, Enums.ValidationLevel.Error);
            ValidationMessages.Add(validationMessage);
        }
    }
}
