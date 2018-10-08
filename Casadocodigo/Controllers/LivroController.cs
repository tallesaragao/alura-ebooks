using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Casadocodigo.Helpers;
using Casadocodigo.Models;
using Casadocodigo.Repositories;
using Casadocodigo.ViewModels;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Casadocodigo.Controllers
{
    public class LivroController : Controller
    {
        private IHostingEnvironment environment;
        private IAutorRepository autorRepository;
        private ILivroRepository livroRepository;
        private ICategoriaRepository categoriaRepository;

        public LivroController(IHostingEnvironment environment, IAutorRepository autorRepository, ILivroRepository livroRepository, ICategoriaRepository categoriaRepository)
        {
            this.environment = environment;
            this.autorRepository = autorRepository;
            this.livroRepository = livroRepository;
            this.categoriaRepository = categoriaRepository;
        }
        
        [Route("/")]
        [Route("Livros")]
        [HttpGet]
        public IActionResult Index()
        {
            var livros = livroRepository.ListAll();
            return View(livros);
        }

        [Route("Livros/{id}")]
        [HttpGet]
        public IActionResult Detalhes(int id)
        {
            Livro livro = livroRepository.FindById(id);
            if(livro == null)
            {
                TempData["Erro"] = "Livro não encontrado";
                return RedirectToAction("Index");
            }
            return View(livro);
        }

        [Route("Livros/Novo")]
        [HttpGet]
        public IActionResult Form()
        {
            ViewBag.Autores = autorRepository.ListAll();
            ViewBag.Categorias = categoriaRepository.ListAll();
            return View();
        }

        [Route("Livros/{id}/Editar")]
        [HttpGet]
        public IActionResult Edit(int id)
        {
            Livro livro = livroRepository.FindById(id);
            if(livro == null)
            {
                TempData["Erro"] = "Livro não encontrado";
                return RedirectToAction("Index");
            }
            ViewBag.Autores = autorRepository.ListAll();
            ViewBag.Categorias = categoriaRepository.ListAll();
            var viewModel = new CadastroLivroVM();
            viewModel.Model = livro;
            return View(viewModel);
        }

        [Route("Livros/Salvar")]
        [HttpPost]
        public IActionResult Salvar(CadastroLivroVM viewModel)
        {
            if (livroRepository.ExistsWithIsbn(viewModel.Isbn))
                ModelState.AddModelError("Isbn", "Já existe um livro com o ISBN informado");
            if (livroRepository.ExistsWithTitulo(viewModel.Titulo))
                ModelState.AddModelError("Nome", "Já existe um livro com o título informado");
            if (ModelState.IsValid)
            {
                Livro livro = viewModel.Model;
                string basePath = Path.Combine(environment.WebRootPath, "images", "produtos");
                string realPath = FileHelper.Save(basePath, viewModel.Arquivo);
                livro.Imagem = new Imagem(realPath);
                livroRepository.Save(livro);
                TempData["Sucesso"] = "Livro cadastrado com sucesso";
                return RedirectToAction("Index");
            }
            ViewBag.Autores = autorRepository.ListAll();
            ViewBag.Categorias = categoriaRepository.ListAll();
            return View("Form", viewModel);
        }

        [Route("Livros/Atualizar")]
        [HttpPost]
        public IActionResult Atualizar(CadastroLivroVM viewModel)
        {
            if (livroRepository.ExistsWithIsbn(viewModel.Isbn))
                ModelState.AddModelError("Isbn", "Já existe um livro com o ISBN informado");
            if (livroRepository.ExistsWithTitulo(viewModel.Titulo))
                ModelState.AddModelError("Nome", "Já existe um livro com o título informado");
            if (ModelState.IsValid)
            {
                Livro livro = viewModel.Model;
                string basePath = Path.Combine(environment.WebRootPath, "images", "produtos");
                string realPath = FileHelper.Save(basePath, viewModel.Arquivo);
                livro.Imagem = new Imagem(realPath);
                livroRepository.Update(livro);
                TempData["Sucesso"] = "Livro atualizado com sucesso";
                return RedirectToAction("Index");
            }
            ViewBag.Autores = autorRepository.ListAll();
            ViewBag.Categorias = categoriaRepository.ListAll();
            return View("Edit", viewModel);
        }
    }
}