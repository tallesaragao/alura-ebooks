using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Casadocodigo.Models
{
    public class Categoria
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Nome obrigatório")]
        public string Nome { get; set; }
        public IList<LivroCategoria> Livros { get; set; }
        public bool Ativa { get; set; } = true;
    }
}