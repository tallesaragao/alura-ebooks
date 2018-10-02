using System.Collections.Generic;

namespace Casadocodigo.Models
{
    public class Categoria
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public IList<LivroCategoria> Livros { get; set; }
        public bool Ativa { get; set; }
    }
}