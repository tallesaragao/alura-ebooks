using System;
using System.ComponentModel.DataAnnotations;
using System.IO;

namespace Casadocodigo.Models
{
    public class Imagem
    {
        public Imagem(string caminhoReal)
        {
            CaminhoReal = caminhoReal;
            Extensao = Path.GetExtension(caminhoReal);
            DataCadastro = DateTime.Now;
            CaminhoAcesso = GetCaminhoAcesso(caminhoReal);
        }

        [Required]
        public string CaminhoReal { get; set; }
        [Required]
        public string CaminhoAcesso { get; set; }
        [Required]
        public string Extensao { get; set; }
        [Required]
        public DateTime DataCadastro { get; private set; }

        private string GetCaminhoAcesso(string caminhoReal)
        {
            if(!string.IsNullOrEmpty(caminhoReal))
            {
                string[] parts = caminhoReal.Split("wwwroot");
                return "~" + parts[parts.Length - 1].Replace("\\", "/");
            }
            return string.Empty;
        }
    }
}