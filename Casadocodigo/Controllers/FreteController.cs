using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Casadocodigo.Models;
using Casadocodigo.Services;
using Casadocodigo.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Casadocodigo.Controllers
{
    public class FreteController : Controller
    {
        private CorreiosService correiosService;

        //public FreteController(CorreiosService correiosService)
        //{
        //    this.correiosService = new CorreiosService();
        //}
        
        [HttpPost]
        public async Task<JsonResult> Calcular([FromBody] ConsultaFreteVM viewModel)
        {
            correiosService = new CorreiosService();
            Frete frete = await correiosService.CalcularFrete(viewModel.Cep);
            return Json(frete);
        }
    }
}