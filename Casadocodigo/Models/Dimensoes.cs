using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Models
{
    public class Dimensoes
    {
        public int Id { get; set; }
        //Unidade de medida - Centímetros
        public decimal Altura { get; set; }
        public decimal Largura { get; set; }
        public decimal Profundidade { get; set; }

        //Unidade de medida - Gramas
        public decimal Peso { get; set; }

    }
}
