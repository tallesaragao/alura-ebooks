using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Casadocodigo.Application;
using Casadocodigo.Models;
using Casadocodigo.Repositories;
using Casadocodigo.Services;
using Microsoft.AspNetCore.Mvc;

namespace Casadocodigo.Controllers
{
    public class AutorController : Controller
    {
        private AutorService autorService;

        public AutorController(AutorService autorService)
        {
            this.autorService = autorService;
        }

        [Route("Autores")]
        [HttpGet]
        public IActionResult Index()
        {
            var autores = autorService.ListarTodos();
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
            Autor autor = autorService.BuscarPorId(id);
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
                var erros = autorService.Salvar(autor);
                foreach (var erro in erros)
                {
                    ModelState.AddModelError(erro.PropertyName, erro.Message);
                }
                if (ModelState.IsValid)
                {
                    TempData["Sucesso"] = "Autor cadastrado com sucesso";
                    return RedirectToAction("Index");
                }
            }
            return View("Form", autor);
        }

        [Route("Autores/Atualizar")]
        [HttpPost]
        public IActionResult Atualizar(Autor autor)
        {
            if (ModelState.IsValid)
            {
                IList<ValidationMessage> erros = autorService.Atualizar(autor);
                foreach (ValidationMessage erro in erros)
                {
                    ModelState.AddModelError(erro.PropertyName, erro.Message);
                }
                if (ModelState.IsValid)
                {
                    TempData["Sucesso"] = "Autor atualizado com sucesso";
                    return RedirectToAction("Index");
                }
            }
            return View("Edit", autor);
        }
    }
}