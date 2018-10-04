using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Casadocodigo.Models
{
    public class Autor
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Nome obrigatório")]
        public string Nome { get; set; }

        [Required(ErrorMessage = "Biografia obrigatória")]
        public string Biografia { get; set; }

        public IList<LivroAutor> Livros { get; set; }
    }
}