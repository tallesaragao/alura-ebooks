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

        [Route("Autores")]
        [HttpGet]
        public IActionResult Index()
        {
            var autores = autorRepository.ListAll();
            return View(autores);
        }

        [Route("Autores/Novo")]
        [HttpGet]
        public IActionResult Form()
        {
            return View();
        }

        [Route("Autores/{id}/Editar")]
        [HttpGet]
        public IActionResult Edit(int id)
        {
            Autor autor = autorRepository.FindById(id);
            if (autor == null)
            {
                TempData["Erro"] = "Nenhum autor encontrado";
                return RedirectToAction("Index");
            }
            return View(autor);
        }

        [Route("Autores/Salvar")]
        [HttpPost]
        public IActionResult Salvar(Autor autor)
        {
            if (ModelState.IsValid)
            {
                if (autorRepository.ExistsWithNome(autor.Nome))
                {
                    ModelState.AddModelError("Nome", "Já existe um autor com esse nome");
                    return View("Form", autor);
                }
                autorRepository.Save(autor);
                TempData["Sucesso"] = "Autor cadastrado com sucesso";
                return RedirectToAction("Index");
            }
            return View("Form", autor);
        }

        [Route("Autores/Atualizar")]
        [HttpPost]
        public IActionResult Atualizar(Autor autor)
        {
            if(ModelState.IsValid)
            {
                Autor autorOld = autorRepository.FindById(autor.Id);
                if (autorOld.Nome != autor.Nome && autorRepository.ExistsWithNome(autor.Nome))
                {
                    ModelState.AddModelError("Nome", "Já existe um autor com esse nome");
                    return View("Edit", autor);
                }
                autorOld.Nome = autor.Nome;
                autorOld.Biografia = autor.Biografia;
                autorRepository.Update(autorOld);
                TempData["Sucesso"] = "Autor atualizado com sucesso";
                return RedirectToAction("Index");
            }
            return View("Edit", autor);
        }
    }
}