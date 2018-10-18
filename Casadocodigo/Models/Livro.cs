using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Models
{
    public class Livro
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Subtitulo { get; set; }
        public string Isbn { get; set; }
        public int DimensoesId { get; set; }
        public Dimensoes Dimensoes { get; set; }
        public Imagem Imagem { get; set; }
        public int Paginas { get; set; }
        public string Descricao { get; set; }
        public IList<LivroAutor> Autores { get; set; }
        public Precificacao Precificacao { get; set; }
        public IList<LivroCategoria> Categorias { get; set; }
        public DateTime DataCadastro { get; set; } = DateTime.Now;
        public bool Ativo { get; set; } = true;
    }
}
