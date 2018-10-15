using Casadocodigo.Application;
using Casadocodigo.Models;
using Casadocodigo.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Services
{
    public class AutorService
    {
        private IAutorRepository autorRepository;

        public AutorService(IAutorRepository autorRepository)
        {
            this.autorRepository = autorRepository;
        }

        public IList<Autor> ListarTodos()
        {
            return autorRepository.ListAll();
        }

        public Autor BuscarPorId(int id)
        {
            return autorRepository.FindById(id);
        }

        public IList<ValidationMessage> Salvar(Autor autor)
        {
            IList<ValidationMessage> erros = new List<ValidationMessage>();
            if (autorRepository.ExistsWithNome(autor.Nome))
            {
                erros.Add(new ValidationMessage("Nome", "Já existe um autor com esse nome"));
            }
            if (erros.Count == 0)
                autorRepository.Save(autor);
            return erros;
        }

        public IList<ValidationMessage> Atualizar(Autor autor)
        {
            IList<ValidationMessage> erros = new List<ValidationMessage>();
            Autor autorOld = autorRepository.FindById(autor.Id);
            if (autorOld.Nome != autor.Nome && autorRepository.ExistsWithNome(autor.Nome))
            {
                erros.Add(new ValidationMessage("Nome", "Já existe um autor com esse nome"));
            }
            if (erros.Count == 0)
            {
                autorOld.Nome = autor.Nome;
                autorOld.Biografia = autor.Biografia;
                autorRepository.Update(autorOld);
            }
            return erros;
        }
    }
}
