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

        public bool ExistsWithTitulo(string titulo)
        {
            return dbSet.Any(livro => livro.Titulo == titulo);
        }

        public Livro FindById(int id)
        {
            return dbSet
                .Include(l => l.Autores)
                    .ThenInclude(la => la.Autor)
                .Include(l => l.Categorias)
                    .ThenInclude(lc => lc.Categoria)
                .Include(l => l.Precificacao)
                .Include(l => l.Imagem)
                .Include(l => l.Dimensoes)
                .Where(l => l.Id == id)
                .FirstOrDefault();
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
