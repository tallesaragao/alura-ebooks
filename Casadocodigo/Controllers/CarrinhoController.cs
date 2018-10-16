using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Casadocodigo.Application;
using Casadocodigo.Extensions;
using Casadocodigo.Models;
using Casadocodigo.Services;
using Casadocodigo.Session;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Casadocodigo.Controllers
{
    public class CarrinhoController : Controller
    {
        private ISession session;
        private LivroService serviceLivro;
        private CarrinhoSession carrinhoSession;

        public CarrinhoController(IHttpContextAccessor accessor, LivroService serviceLivro, CarrinhoSession carrinhoSession)
        {
            session = accessor.HttpContext.Session;
            this.serviceLivro = serviceLivro;
            this.carrinhoSession = carrinhoSession;
        }

        [Route("Carrinho")]
        public IActionResult Index()
        {
            return View(carrinhoSession.Carrinho);
        }

        [HttpPost]
        public IActionResult Adicionar(int livroId)
        {
            Livro livro = serviceLivro.BuscarPorId(livroId);
            if(livro != null)
            {
                carrinhoSession.Adicionar(livro);
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult Remover(int livroId)
        {
            carrinhoSession.Remover(livroId);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult Alterar(int livroId, int quantidade)
        {
            bool valido = true;
            if (quantidade <= 0)
            {
                TempData["Erro"] = "Quantidade inválida";
                valido = false;
            }
            if (serviceLivro.BuscarPorId(livroId) == null || !carrinhoSession.HasLivro(livroId))
            {
                TempData["Erro"] = "Livro não encontrado";
                valido = false;
            }
            if (valido)
                carrinhoSession.AlterarQuantidade(livroId, quantidade);
            return RedirectToAction("Index");
        }
    }
}