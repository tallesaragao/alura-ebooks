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
        public IActionResult Index()
        {
            var livros = livroRepository.ListAll();
            return View(livros);
        }

        public IActionResult Form()
        {
            ViewBag.Autores = autorRepository.ListAll();
            ViewBag.Categorias = categoriaRepository.ListAll();
            return View();
        }

        public IActionResult Salvar(CadastroLivroVM viewModel)
        {
            if (ModelState.IsValid)
            {
                Livro livro = viewModel.Model();
                string basePath = Path.Combine(environment.WebRootPath, "images", "produtos");
                string realPath = FileHelper.Save(basePath, viewModel.Arquivo);
                livro.Imagem = new Imagem(realPath);
                livroRepository.Save(livro);
                return RedirectToAction("Index");
            }
            ViewBag.Autores = autorRepository.ListAll();
            ViewBag.Categorias = categoriaRepository.ListAll();
            return View("Form", viewModel);
        }
    }
}