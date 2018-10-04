using Casadocodigo.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.ViewModels
{
    public class CadastroLivroVM : IViewModel<Livro>
    {
        [Required(ErrorMessage = "Nome obrigatório")]
        public string Nome { get; set; }

        [Required(ErrorMessage = "ISBN obrigatório")]
        public string Isbn { get; set; }

        [Required(ErrorMessage = "Descrição obrigatória")]
        public string Descricao { get; set; }

        [Required(ErrorMessage = "Número de páginas obrigatório")]
        public int? Paginas { get; set; }

        [Required(ErrorMessage = "Preço unitário obrigatório")]
        public decimal? PrecoUnitario { get; set; }

        [Required(ErrorMessage = "Selecione ao menos um autor")]
        public int[] AutoresIds { get; set; }

        [Required(ErrorMessage = "Selecione ao menos uma categoria")]
        public int[] CategoriasIds { get; set; }

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

        public Livro Model()
        {
            var autores = new List<LivroAutor>();
            foreach(int autorId in AutoresIds)
            {
                autores.Add(new LivroAutor() { AutorId = autorId });
            }

            var categorias = new List<LivroCategoria>();
            foreach (int categoriaId in CategoriasIds)
            {
                categorias.Add(new LivroCategoria() { CategoriaId = categoriaId });
            }
            return new Livro()
            {
                Nome = Nome,
                Descricao = Descricao,
                Paginas = Paginas.Value,
                Precificacao = new Precificacao() { PrecoUnitario = PrecoUnitario.Value },
                Isbn = Isbn,
                Categorias = categorias,
                Autores = autores                
            };
        }
    }
}
