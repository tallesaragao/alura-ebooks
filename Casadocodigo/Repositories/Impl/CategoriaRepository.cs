using Casadocodigo.DbContexts;
using Casadocodigo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Repositories
{
    public class CategoriaRepository : GenericRepository<Categoria>, ICategoriaRepository
    {
        public CategoriaRepository(ApplicationContext context) : base(context) { }

        public Categoria FindById(int id)
        {
            return context.Categorias.Where(c => c.Id == id).FirstOrDefault();
        }
    }
}
