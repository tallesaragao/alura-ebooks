using Casadocodigo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Repositories
{
    public interface IAutorRepository
    {
        void Save(Autor autor);
        void Update(Autor autor);
        IList<Autor> ListAll();
        Autor FindById(int id);
        bool ExistsWithNome(string nome);
    }
}
