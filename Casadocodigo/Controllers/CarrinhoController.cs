using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Casadocodigo.Application;
using Casadocodigo.Extensions;
using Casadocodigo.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Casadocodigo.Controllers
{
    public class CarrinhoController : Controller
    {
        public ISession Session { get; }
        public CarrinhoController(IHttpContextAccessor accessor)
        {
            Session = accessor.HttpContext.Session;
            if (Session.GetObject<Carrinho>("Carrinho") == null)
                Session.SetObject("Carrinho", new Carrinho());
        }

        [Route("Carrinho")]
        public IActionResult Index()
        {
            return View();
        }
    }
}