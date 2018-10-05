using Casadocodigo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Repositories
{
    public interface ILivroRepository : IRepository
    {
        void Save(Livro livro);
        void Update(Livro livro);
        void Activate(Livro livro);
        void Inactivate(Livro livro);
        IList<Livro> ListAll();
        Livro FindById(int id);
        bool ExistsWithIsbn(string isbn);
        bool ExistsWithNome(string nome);
    }
}
