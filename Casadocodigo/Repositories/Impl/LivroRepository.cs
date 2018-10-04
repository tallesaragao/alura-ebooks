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
            context.Livros.Update(livro);
            context.SaveChanges();
        }

        public Livro FindById(int id)
        {
            return context.Livros.Find(id);
        }

        public void Inactivate(Livro livro)
        {
            livro.Ativo = true;
            context.Livros.Update(livro);
            context.SaveChanges();
        }

        public override IList<Livro> ListAll()
        {
            return context.Livros
                .Include(l => l.Imagem)
                .Include(l => l.Precificacao)
                .ToList();
        }

    }
}
