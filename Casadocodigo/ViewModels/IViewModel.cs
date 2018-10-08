using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.ViewModels
{
    public interface IViewModel<T> where T : class
    {
        T Model { get; set; }
    }
}
