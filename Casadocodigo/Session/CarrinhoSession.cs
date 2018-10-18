using Casadocodigo.Extensions;
using Casadocodigo.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Session
{
    public class CarrinhoSession
    {
        private ISession session;

        public CarrinhoSession(IHttpContextAccessor contextAccessor)
        {
            session = contextAccessor.HttpContext.Session;
            carrinho = session.GetObject<Carrinho>("Carrinho");
            if(carrinho == null)
            {
                carrinho = new Carrinho();
                session.SetObject("Carrinho", carrinho);
            }
        }

        private Carrinho carrinho;

        // Propriedade para retornar cópia do objeto. Somente leitura
        public Carrinho Carrinho
        {
            get
            {
                return new Carrinho()
                {
                    Pedido = carrinho.Pedido
                };
            }
        }

        public decimal Subtotal { get => carrinho.Subtotal; }

        public int Quantidade { get => carrinho.Quantidade; }

        public IList<ItemPedido> Itens
        {
            get
            {
                return new ReadOnlyCollection<ItemPedido>(carrinho.Itens);
            }
        }

        public void Adicionar(Livro livro)
        {
            carrinho.Adicionar(livro);
            session.SetObject("Carrinho", carrinho);
        }

        public void AlterarQuantidade(int livroId, int quantidade)
        {
            carrinho.AlterarQuantidade(livroId, quantidade);
            session.SetObject("Carrinho", carrinho);
        }

        public void Remover(Livro livro)
        {
            Remover(livro.Id);
            session.SetObject("Carrinho", carrinho);
        }

        public void Remover(int livroId)
        {
            carrinho.Remover(livroId);
            session.SetObject("Carrinho", carrinho);
        }

        public bool HasItens()
        {
            return carrinho.HasItens();
        }

        public bool HasLivro(int livroId)
        {
            return carrinho.HasLivro(livroId);
        }

        public void AdicionarFrete(Frete frete)
        {
            carrinho.AdicionarFrete(frete);
            session.SetObject("Carrinho", carrinho);
        }
    }
}
