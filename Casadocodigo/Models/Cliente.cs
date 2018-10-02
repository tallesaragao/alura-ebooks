using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Models
{
    public class Cliente
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Cpf { get; set; }
        public DateTime DataNascimento { get; set; }
        public int EnderecoPrincipalId { get; set; }
        public Endereco EnderecoPrincipal { get; set; }
        public IList<Endereco> Enderecos { get; set; }
        public IList<CartaoCredito> CartoesCredito { get; set; }
        public IList<Pedido> Pedidos { get; set; }
        public DateTime DataCadastro { get; set; }
        public bool Ativo { get; set; }
    }
}
