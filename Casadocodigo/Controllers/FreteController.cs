using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Casadocodigo.Models;
using Casadocodigo.Services;
using Casadocodigo.Session;
using Casadocodigo.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Casadocodigo.Controllers
{
    public class FreteController : Controller
    {
        private CorreiosService correiosService;
        private CarrinhoSession carrinhoSession;

        public FreteController(CorreiosService correiosService, CarrinhoSession carrinhoSession)
        {
            this.correiosService = correiosService;
            this.carrinhoSession = carrinhoSession;
        }

        [HttpPost]
        public async Task<JsonResult> Calcular([FromBody] ConsultaFreteVM viewModel)
        {
            Frete frete = await correiosService.CalcularFrete(viewModel.Cep, carrinhoSession.Carrinho.Pedido.ItensPedido);
            return Json(frete);
        }
    }
}