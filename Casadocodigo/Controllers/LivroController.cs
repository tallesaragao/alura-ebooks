using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Casadocodigo.Helpers;
using Casadocodigo.Models;
using Casadocodigo.Repositories;
using Casadocodigo.Services;
using Casadocodigo.ViewModels;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace Casadocodigo.Controllers
{
    public class LivroController : Controller
    {
        private IHostingEnvironment environment;
        private IAutorRepository autorRepository;
        private LivroService livroService;
        private ICategoriaRepository categoriaRepository;

        public LivroController(IHostingEnvironment environment, IAutorRepository autorRepository, LivroService livroService, ICategoriaRepository categoriaRepository)
        {
            this.environment = environment;
            this.autorRepository = autorRepository;
            this.livroService = livroService;
            this.categoriaRepository = categoriaRepository;
        }
        
        [Route("/")]
        [Route("Livros")]
        [HttpGet]
        public IActionResult Index()
        {
            var livros = livroService.ListarTodos();
            return View(livros);
        }

        [Route("Livros/{id}")]
        [HttpGet]
        public IActionResult Detalhes(int id)
        {
            Livro livro = livroService.BuscarPorId(id);
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
            Livro livro = livroService.BuscarPorId(id);
            if(livro == null)
            {
                TempData["Erro"] = "Livro não encontrado";
                return RedirectToAction("Index");
            }
            ViewBag.Autores = autorRepository.ListAll();
            ViewBag.Categorias = categoriaRepository.ListAll();
            EdicaoLivroVM viewModel = new EdicaoLivroVM();
            viewModel.Model = livro;
            return View(viewModel);
        }

        [Route("Livros/Salvar")]
        [HttpPost]
        public IActionResult Salvar(CadastroLivroVM viewModel)
        {
            if (ModelState.IsValid)
            {
                Livro livro = viewModel.Model;
                string basePath = Path.Combine(environment.WebRootPath, "images", "produtos");
                var errors = livroService.Salvar(livro, viewModel.Arquivo.OpenReadStream(), viewModel.Arquivo.FileName, basePath);
                foreach(var error in errors)
                {
                    ModelState.AddModelError(error.PropertyName, error.Message);
                }
                if(ModelState.IsValid)
                {
                    TempData["Sucesso"] = "Livro cadastrado com sucesso";
                    return RedirectToAction("Index");
                }                
            }
            ViewBag.Autores = autorRepository.ListAll();
            ViewBag.Categorias = categoriaRepository.ListAll();
            return View("Form", viewModel);
        }

        [Route("Livros/Atualizar")]
        [HttpPost]
        public IActionResult Atualizar(EdicaoLivroVM viewModel)
        {
            
            if (ModelState.IsValid)
            {
                Livro livro = viewModel.Model;
                var erros = livroService.Atualizar(livro);
                foreach(var erro in erros)
                {
                    ModelState.AddModelError(erro.PropertyName, erro.Message);
                }
                if (ModelState.IsValid)
                {
                    TempData["Sucesso"] = "Livro atualizado com sucesso";
                    return RedirectToAction("Index");
                }
            }
            ViewBag.Autores = autorRepository.ListAll();
            ViewBag.Categorias = categoriaRepository.ListAll();
            return View("Edit", viewModel);
        }
    }
}