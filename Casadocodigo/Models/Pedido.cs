using System;
using System.Collections.Generic;

namespace Casadocodigo.Models
{
    public class Pedido
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public int ClienteId { get; set; }
        public Cliente Cliente { get; set; }
        public IList<ItemPedido> ItensPedido { get; set; }
        public Status Status { get; set; }
        public DateTime DataRealizacao { get; set; }
    }
}