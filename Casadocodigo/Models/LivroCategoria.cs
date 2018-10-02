using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Models
{
    public class LivroCategoria
    {
        public int LivroId { get; set; }
        public Livro Livro { get; set; }
        public int CategoriaId { get; set; }
        public Categoria Categoria { get; set; }
    }
}
