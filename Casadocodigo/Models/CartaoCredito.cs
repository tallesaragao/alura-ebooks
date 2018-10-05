using CreditCardValidator;
using System;

namespace Casadocodigo.Models
{
    public class CartaoCredito
    {
        public int Id { get; set; }
        public string NomeTitular { get; set; }
        public string Numero { get; set; }
        public DateTime Validade { get; set; }
        public Bandeira Bandeira { get; set; }
        public string Codigo { get; set; }
        public bool Ativo { get; set; } = true;
    }
}