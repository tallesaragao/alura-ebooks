using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Casadocodigo.Helpers;
using Casadocodigo.Models;
using Casadocodigo.Repositories;
using Casadocodigo.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Casadocodigo.Controllers
{
    public class LivroController : Controller
    {
        private IAutorRepository autorRepository;
        private ILivroRepository livroRepository;

        public LivroController(IAutorRepository autorRepository, ILivroRepository livroRepository)
        {
            this.autorRepository = autorRepository;
            this.livroRepository = livroRepository;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Form()
        {
            ViewBag.Autores = autorRepository.ListAll();
            return View();
        }

        public IActionResult Salvar(CadastroLivroVM viewModel)
        {
            if (ModelState.IsValid)
            {
                var livro = viewModel.Model();
                livro.Imagem = FileHelper.Save(null, viewModel.Arquivo);
                livroRepository.Save(livro);
                return RedirectToAction("Index");
            }
            return View("Form", viewModel);
        }
    }
}