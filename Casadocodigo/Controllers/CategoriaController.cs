using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Casadocodigo.Models;
using Casadocodigo.Repositories;
using Casadocodigo.Services;
using Microsoft.AspNetCore.Mvc;

namespace Casadocodigo.Controllers
{
    public class CategoriaController : Controller
    {
        private CategoriaService categoriaService;

        public CategoriaController(CategoriaService categoriaService)
        {
            this.categoriaService = categoriaService;
        }

        [Route("Categorias")]
        [HttpGet]
        public IActionResult Index()
        {
            var categorias = categoriaService.ListarTodos();
            return View(categorias);
        }

        [Route("Categorias/Nova")]
        [HttpGet]
        public IActionResult Form()
        {
            return View();
        }

        [Route("Categorias/Editar/{id}")]
        [HttpGet]
        public IActionResult Edit(int id)
        {
            Categoria categoria = categoriaService.BuscarPorId(id);
            if(categoria == null)
            {
                TempData["Erro"] = "Nenhuma categoria encontrada";
                return RedirectToAction("Index");
            }
            return View(categoria);
        }

        [Route("Categorias/Salvar")]
        [HttpPost]
        public IActionResult Salvar(Categoria categoria)
        {
            if (ModelState.IsValid)
            {
                var erros = categoriaService.Salvar(categoria);
                foreach (var erro in erros)
                {
                    ModelState.AddModelError(erro.PropertyName, erro.Message);
                }
                if (ModelState.IsValid)
                {
                    TempData["Sucesso"] = "Categoria cadastrada com sucesso";
                    return RedirectToAction("Index");
                }
            }
            return View("Form", categoria);
        }

        [Route("Categorias/Atualizar")]
        [HttpPost]
        public IActionResult Atualizar(Categoria categoria)
        {
            if (ModelState.IsValid)
            {
                var erros = categoriaService.Atualizar(categoria);
                foreach (var erro in erros)
                {
                    ModelState.AddModelError(erro.PropertyName, erro.Message);
                }
                if (ModelState.IsValid)
                {
                    TempData["Sucesso"] = "Categoria cadastrada com sucesso";
                    return RedirectToAction("Index");
                }
            }
            return View("Edit", categoria);
        }
    }
}