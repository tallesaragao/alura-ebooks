using Casadocodigo.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.ViewModels
{
    public class CadastroLivroVM : IViewModel<Livro>
    {
        public string Nome { get; set; }
        public string Descricao { get; set; }
        public int Paginas { get; set; }
        public int AutorId { get; set; }
        public IFormFile Arquivo { get; set; }

        public Livro Model()
        {
            return new Livro()
            {
                Nome = Nome,
                Descricao = Descricao,
                Paginas = Paginas,
                AutorId = AutorId
            };
        }
    }
}
