using Casadocodigo.DbContexts;
using Casadocodigo.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Repositories.Impl
{
    public class LivroRepository : GenericRepository<Livro>, ILivroRepository
    {
        public LivroRepository(ApplicationContext context) : base(context)
        {
        }

        public void Activate(Livro livro)
        {
            livro.Ativo = false;
            dbSet.Update(livro);
            context.SaveChanges();
        }

        public bool ExistsWithIsbn(string isbn)
        {
            return dbSet.Any(livro => livro.Isbn == isbn);
        }

        public bool ExistsWithNome(string nome)
        {
            return dbSet.Any(livro => livro.Nome == nome);
        }

        public Livro FindById(int id)
        {
            return dbSet.Find(id);
        }

        public void Inactivate(Livro livro)
        {
            livro.Ativo = true;
            dbSet.Update(livro);
            context.SaveChanges();
        }

        public override IList<Livro> ListAll()
        {
            return dbSet
                .Include(l => l.Imagem)
                .Include(l => l.Precificacao)
                .ToList();
        }

    }
}
