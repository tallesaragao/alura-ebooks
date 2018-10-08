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
        public int Id { get; set; }

        [Required(ErrorMessage = "Título obrigatório")]
        public string Titulo { get; set; }

        [Required(ErrorMessage = "Subtítulo obrigatório")]
        public string Subtitulo { get; set; }

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

        private Livro model;
        public Livro Model
        {
            get
            {
                var autores = new List<LivroAutor>();
                foreach (int autorId in AutoresIds)
                {
                    autores.Add(new LivroAutor() { AutorId = autorId });
                }

                var categorias = new List<LivroCategoria>();
                foreach (int categoriaId in CategoriasIds)
                {
                    categorias.Add(new LivroCategoria() { CategoriaId = categoriaId });
                }
                return model;
            }
            set
            {
                model = value;
                int[] autoresIds = new int[value.Autores.Count];
                for (int i = 0; i < model.Autores.Count; i++)
                {
                    autoresIds[i] = model.Autores.ElementAt(i).AutorId;
                }
                int[] categoriasIds = new int[model.Categorias.Count];
                for (int i = 0; i < model.Categorias.Count; i++)
                {
                    categoriasIds[i] = model.Categorias.ElementAt(i).CategoriaId;
                }
                Id = model.Id;
                AutoresIds = autoresIds;
                CategoriasIds = categoriasIds;
                Titulo = model.Titulo;
                Subtitulo = model.Subtitulo;
                Descricao = model.Descricao;
                Isbn = model.Isbn;
                Paginas = model.Paginas;
                PrecoUnitario = model.Precificacao.PrecoUnitario;
            }
            
        }
    }
}
