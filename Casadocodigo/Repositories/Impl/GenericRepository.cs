using Casadocodigo.DbContexts;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Repositories
{
    public abstract class GenericRepository<T> where T : class
    {
        protected ApplicationContext context;
        protected DbSet<T> dbSet;

        public GenericRepository(ApplicationContext context)
        {
            this.context = context;
            dbSet = context.Set<T>();
        }

        public virtual void Save(T entity)
        {
            context.Set<T>().Add(entity);
            context.SaveChanges();
        }

        public virtual void Update(T entity)
        {
            context.Set<T>().Update(entity);
            context.SaveChanges();
        }

        public virtual void Remove(T entity)
        {
            context.Set<T>().Remove(entity);
            context.SaveChanges();
        }

        public virtual IList<T> ListAll()
        {
            return context.Set<T>().ToList();
        }
    }
}
