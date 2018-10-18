using Casadocodigo.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.ViewModels
{
    public abstract class LivroVM : IViewModel<Livro>
    {

        [Required(ErrorMessage = "Título obrigatório")]
        public virtual string Titulo { get; set; }
        
        public virtual string Subtitulo { get; set; }

        [Required(ErrorMessage = "ISBN obrigatório")]
        public virtual string Isbn { get; set; }

        [Required(ErrorMessage = "Descrição obrigatória")]
        public virtual string Descricao { get; set; }

        [Required(ErrorMessage = "Número de páginas obrigatório")]
        public virtual int? Paginas { get; set; }

        [Required(ErrorMessage = "Preço unitário obrigatório")]
        [Range(0.01, (double)decimal.MaxValue, ErrorMessage = "Preço unitário inválido")]
        public virtual decimal? PrecoUnitario { get; set; }

        [Required(ErrorMessage = "Selecione ao menos um autor")]
        public virtual int[] AutoresIds { get; set; }

        [Required(ErrorMessage = "Selecione ao menos uma categoria")]
        public virtual int[] CategoriasIds { get; set; }

        [Required(ErrorMessage = "Altura obrigatória")]
        [Range(0.1, (double)decimal.MaxValue, ErrorMessage = "Altura inválida")]
        public virtual decimal? Altura { get; set; }

        [Required(ErrorMessage = "Largura obrigatória")]
        [Range(0.1, (double)decimal.MaxValue, ErrorMessage = "Largura inválida")]
        public virtual decimal? Largura { get; set; }

        [Required(ErrorMessage = "Profundidade obrigatória")]
        [Range(0.1, (double) decimal.MaxValue, ErrorMessage = "Profundidade inválida")]
        public virtual decimal? Profundidade { get; set; }

        [Required(ErrorMessage = "Peso obrigatório")]
        [Range(1, (double)decimal.MaxValue, ErrorMessage = "Peso inválido")]
        public virtual decimal? Peso { get; set; }


        protected Livro model = new Livro();
        public virtual Livro Model
        {
            get
            {
                model.Descricao = Descricao;
                model.Isbn = Isbn;
                model.Paginas = Paginas ?? 0;
                model.Precificacao = new Precificacao();
                model.Precificacao.PrecoUnitario = PrecoUnitario ?? 0;
                model.Subtitulo = Subtitulo;
                model.Titulo = Titulo;
                model.Dimensoes = new Dimensoes()
                {
                    Altura = Altura ?? 0,
                    Largura = Largura ?? 0,
                    Profundidade = Profundidade ?? 0,
                    Peso = Peso ?? 0
                };
                var autores = new List<LivroAutor>();
                if (AutoresIds != null)
                { 
                    foreach (int autorId in AutoresIds)
                    {
                        autores.Add(new LivroAutor() { AutorId = autorId });
                    }
                }
                var categorias = new List<LivroCategoria>();
                if (CategoriasIds != null)
                {
                    foreach (int categoriaId in CategoriasIds)
                    {
                        categorias.Add(new LivroCategoria() { CategoriaId = categoriaId });
                    }
                }
                model.Autores = autores;
                model.Categorias = categorias;
                return model;
            }
            set
            {
                model = value;
                int[] autoresIds = new int[model.Autores.Count];
                for (int i = 0; i < model.Autores.Count; i++)
                {
                    autoresIds[i] = model.Autores.ElementAt(i).AutorId;
                }
                int[] categoriasIds = new int[model.Categorias.Count];
                for (int i = 0; i < model.Categorias.Count; i++)
                {
                    categoriasIds[i] = model.Categorias.ElementAt(i).CategoriaId;
                }
                Altura = model.Dimensoes.Altura;
                Largura = model.Dimensoes.Largura;
                Profundidade = model.Dimensoes.Profundidade;
                Peso = model.Dimensoes.Peso;
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
