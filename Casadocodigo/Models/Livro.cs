using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Models
{
    public class Livro
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Codigo { get; set; }
        public string Imagem { get; set; }
        public int Paginas { get; set; }
        public string Descricao { get; set; }
        public int AutorId { get; set; }
        public Autor Autor { get; set; }
        public Precificacao Precificacao { get; set; }
        public IList<LivroCategoria> Categorias { get; set; }
        public DateTime DataCadastro { get; set; }
        public bool Ativo { get; set; }
    }
}
