using Casadocodigo.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.ViewModels
{
    public class CadastroLivroVM : LivroVM
    {
        private IFormFile arquivo;
        
        [Required(ErrorMessage = "Imagem obrigatória")]
        public IFormFile Arquivo
        {
            get
            {
                return arquivo;
            }
            set
            {
                arquivo = value;
                NomeArquivo = value.FileName;
            }
        }

        [FileExtensions(Extensions = "jpg, jpeg", ErrorMessage = "Tipo de arquivo inválido (Somente jpg, jpeg)")]
        public string NomeArquivo { get; set; }

        public override Livro Model
        {
            get
            {
                return base.Model;
            }
            set
            {
                base.Model = value;
            }
        }
    }
}
