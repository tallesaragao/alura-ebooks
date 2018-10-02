using Casadocodigo.DbContexts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Repositories
{
    public abstract class GenericRepository<T> where T : class
    {
        protected ApplicationContext context;

        public void Save(T entity)
        {
            context.Set<T>().Add(entity);
            context.SaveChanges();
        }
    }
}
