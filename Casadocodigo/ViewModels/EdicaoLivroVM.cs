using Casadocodigo.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.ViewModels
{
    public class EdicaoLivroVM : LivroVM
    {
        [Required]
        public int Id { get; set; }

        public override Livro Model
        {
            get
            {
                var model = base.Model;
                model.Id = Id;
                return model;
            }
            set
            {
                base.Model = value;
                base.Model.Id = value.Id;
            }
        }
    }
}
