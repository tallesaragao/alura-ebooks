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

        [Route("Categorias")]
        [HttpGet]
        public IActionResult Index()
        {
            var categorias = categoriaRepository.ListAll();
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
            Categoria categoria = categoriaRepository.FindById(id);
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
            if(categoriaRepository.ExistsWithNome(categoria.Nome))
                ModelState.AddModelError("Nome", "Já existe uma categoria com o nome informado");
            if(ModelState.IsValid)
            {
                categoriaRepository.Save(categoria);
                TempData["Sucesso"] = "Categoria cadastrada com sucesso";
                return RedirectToAction("Index");
            }
            return View("Form", categoria);
        }

        [Route("Categorias/Atualizar")]
        [HttpPost]
        public IActionResult Atualizar(Categoria categoria)
        {
            if (ModelState.IsValid)
            {
                categoriaRepository.Update(categoria);
                TempData["Sucesso"] = "Categoria atualizada com sucesso";
                return RedirectToAction("Index");
            }
            return View("Edit", categoria);
        }
    }
}