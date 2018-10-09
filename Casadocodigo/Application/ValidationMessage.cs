using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Application
{
    public class ValidationMessage
    {
        public ValidationMessage(string propertyName, string message)
        {
            PropertyName = propertyName;
            Message = message;
        }
        public string PropertyName { get; set; }
        public string Message { get; set; }
    }
}
