using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Casadocodigo.Models;
using Casadocodigo.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Casadocodigo.Controllers
{
    public class CategoriaController : Controller
    {
        private ICategoriaRepository categoriaRepository;

        public CategoriaController(ICategoriaRepository categoriaRepository)
        {
            this.categoriaRepository = categoriaRepository;
        }
        public IActionResult Index()
        {
            var categorias = categoriaRepository.ListAll();
            return View(categorias);
        }

        public IActionResult Form()
        {
            return View();
        }

        public IActionResult Salvar(Categoria categoria)
        {
            if(ModelState.IsValid)
            {
                categoriaRepository.Save(categoria);
                return RedirectToAction("Index");
            }
            return View("Form", categoria);
        }
    }
}