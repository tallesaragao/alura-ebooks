using Casadocodigo.Application;
using Casadocodigo.Helpers;
using Casadocodigo.Models;
using Casadocodigo.Repositories;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Services
{
    public class LivroService
    {
        private ILivroRepository livroRepository;

        public LivroService(ILivroRepository livroRepository)
        {
            this.livroRepository = livroRepository;
        }

        public IList<ValidationMessage> Salvar(Livro livro, Stream arquivo, string nomeArquivo, string imagesBasePath)
        {
            var erros = new List<ValidationMessage>();
            if (livroRepository.ExistsWithIsbn(livro.Isbn))
                erros.Add(new ValidationMessage("Isbn", "Já existe um livro com o ISBN informado"));
            if (livroRepository.ExistsWithTitulo(livro.Titulo))
                erros.Add(new ValidationMessage("Nome", "Já existe um livro com o título informado"));
            if (erros.Count == 0)
            {
                livro.Imagem = SalvarImagem(arquivo, nomeArquivo, imagesBasePath);
                livroRepository.Save(livro);
            }
            return erros;
        }

        public IList<Livro> ListarTodos()
        {
            return livroRepository.ListAll();
        }

        private Imagem SalvarImagem(Stream arquivo, string nomeArquivo, string imagesBasePath)
        {
            string realPath = FileHelper.Save(imagesBasePath, nomeArquivo, arquivo);
            return new Imagem(realPath);
        }

        public Livro BuscarPorId(int id)
        {
            return livroRepository.FindById(id);
        }

        public IList<ValidationMessage> Atualizar(Livro livro)
        {
            var erros = new List<ValidationMessage>();
            if (livroRepository.ExistsWithIsbn(livro.Isbn))
                erros.Add(new ValidationMessage("Isbn", "Já existe um livro com o ISBN informado"));
            if (livroRepository.ExistsWithTitulo(livro.Titulo))
                erros.Add(new ValidationMessage("Nome", "Já existe um livro com o título informado"));
            if (erros.Count == 0)
            {
                Livro livroOld = livroRepository.FindById(livro.Id);
                livroOld.Isbn = livro.Isbn;
                livroOld.Paginas = livro.Paginas;
                livroOld.Precificacao.PrecoUnitario = livro.Precificacao.PrecoUnitario;
                livroOld.Titulo = livro.Titulo;
                livroOld.Subtitulo = livro.Titulo;
                livroOld.Autores = livro.Autores;
                livroOld.Categorias = livro.Categorias;
                livroOld.Descricao = livro.Descricao;
                livroRepository.Update(livroOld);
            }
            return erros;
        }
    }
}
