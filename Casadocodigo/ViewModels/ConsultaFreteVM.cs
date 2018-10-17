using Casadocodigo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Threading.Tasks;

namespace Casadocodigo.ViewModels
{
    [DataContract]
    public class ConsultaFreteVM : IViewModel<Frete>
    {
        [DataMember]
        public string Cep { get; set; }

        [IgnoreDataMember]
        public Frete Model { get; set; }
    }
}
