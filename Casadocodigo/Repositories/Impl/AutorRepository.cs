using Casadocodigo.DbContexts;
using Casadocodigo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Repositories.Impl
{
    public class AutorRepository : GenericRepository<Autor>, IAutorRepository
    {
        public AutorRepository(ApplicationContext context) : base(context) { }

        public Autor FindById(int id)
        {
            return context.Autores.Find(id);
        }
    }
}
