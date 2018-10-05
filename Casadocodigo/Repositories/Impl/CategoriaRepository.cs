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

        public bool ExistsWithNome(string nome)
        {
            return dbSet.Any(categoria => categoria.Nome == nome);
        }

        public Categoria FindById(int id)
        {
            return context.Categorias.Find(id);
        }

        public override IList<Categoria> ListAll()
        {
            return context.Categorias.OrderBy(categoria => categoria.Nome).ToList();
        }
    }
}
