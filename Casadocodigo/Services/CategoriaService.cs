using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Casadocodigo.Application;
using Casadocodigo.Models;
using Casadocodigo.Repositories;

namespace Casadocodigo.Services
{
    public class CategoriaService
    {
        private ICategoriaRepository categoriaRepository;

        public CategoriaService(ICategoriaRepository categoriaRepository)
        {
            this.categoriaRepository = categoriaRepository;
        }
        public IList<Categoria> ListarTodos()
        {
            return categoriaRepository.ListAll();
        }

        public Categoria BuscarPorId(int id)
        {
            return categoriaRepository.FindById(id);
        }

        public IList<ValidationMessage> Salvar(Categoria categoria)
        {
            var erros = new List<ValidationMessage>();
            if (categoriaRepository.ExistsWithNome(categoria.Nome))
                erros.Add(new ValidationMessage("Nome", "Já existe uma categoria com o nome informado"));
            if (erros.Count == 0)
                categoriaRepository.Save(categoria);
            return erros;
        }

        public IList<ValidationMessage> Atualizar(Categoria categoria)
        {
            var erros = new List<ValidationMessage>();
            Categoria categoriaOld = categoriaRepository.FindById(categoria.Id);
            if (categoria.Nome != categoriaOld.Nome && categoriaRepository.ExistsWithNome(categoria.Nome))
                erros.Add(new ValidationMessage("Nome", "Já existe uma categoria com o nome informado"));
            if (erros.Count == 0)
                categoriaRepository.Update(categoria);
            return erros;
        }
    }
}
