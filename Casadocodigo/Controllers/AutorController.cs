using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Casadocodigo.Models;
using Casadocodigo.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Casadocodigo.Controllers
{
    public class AutorController : Controller
    {
        private IAutorRepository autorRepository;

        public AutorController(IAutorRepository autorRepository)
        {
            this.autorRepository = autorRepository;
        }

        public IActionResult Index()
        {
            var autores = autorRepository.ListAll();
            return View(autores);
        }

        public IActionResult Form()
        {
            return View();
        }

        public IActionResult Salvar(Autor autor)
        {
            if (ModelState.IsValid)
            {
                autorRepository.Save(autor);
                return RedirectToAction("Index");
            }
            return View("Form", autor);
        }
    }
}