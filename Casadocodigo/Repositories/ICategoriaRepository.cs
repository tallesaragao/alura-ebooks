using Casadocodigo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Repositories
{
    public interface ICategoriaRepository : IRepository
    {
        void Save(Categoria categoria);
        void Update(Categoria categoria);
        void Remove(Categoria categoria);
        IList<Categoria> ListAll();
        Categoria FindById(int id);
        bool ExistsWithNome(string nome);
    }
}
