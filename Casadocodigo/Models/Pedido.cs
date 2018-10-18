using System;
using System.Collections.Generic;
using System.Linq;

namespace Casadocodigo.Models
{
    public class Pedido
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public int ClienteId { get; set; }
        public Cliente Cliente { get; set; }
        public IList<ItemPedido> ItensPedido { get; set; } = new List<ItemPedido>();
        public Status Status { get; set; }
        public DateTime DataRealizacao { get; set; }
        public Frete Frete { get; set; }

        private decimal subtotal;
        public decimal Subtotal       {
            get
            {
                return ItensPedido.Sum(ip => ip.Subtotal); ;
            }
            private set
            {
                subtotal = value;
            }
        }

        private decimal total;
        public decimal Total
        {
            get
            {
                return Frete != null ? Frete.Valor + Subtotal : Subtotal;
            }
            private set
            {
                total = value;
            }
        }
    }
}