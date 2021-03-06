﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Models
{
    public class Carrinho
    {
        public Carrinho()
        {
            Pedido = new Pedido();
        }
        public Pedido Pedido { get; set; }

        public decimal Subtotal
        {
            get
            {
                return Pedido.Subtotal;
            }
        }

        public int Quantidade { get => Pedido.ItensPedido.Count; }

        public IList<ItemPedido> Itens
        {
            get
            {
                return new ReadOnlyCollection<ItemPedido>(Pedido.ItensPedido);
            }
        }

        public void Adicionar(Livro livro)
        {
            ItemPedido item = new ItemPedido()
            {
                Livro = livro,
                LivroId = livro.Id,
                Quantidade = 1
            };
            if (!Pedido.ItensPedido.Any(ip => ip.LivroId == livro.Id))
                Pedido.ItensPedido.Add(item);
        }

        public void AlterarQuantidade(int livroId, int quantidade)
        {
            ItemPedido item = Pedido.ItensPedido.Where(ip => ip.LivroId == livroId).Single();
            item.Quantidade = quantidade;
        }

        public void Remover(Livro livro)
        {
            Remover(livro.Id);
        }

        public void Remover(int livroId)
        {
            ItemPedido itemPedido = Pedido.ItensPedido.Where(ip => ip.LivroId == livroId).Single();
            Pedido.ItensPedido.Remove(itemPedido);
        }

        public bool HasItens()
        {
            return Pedido.ItensPedido.Count > 0;
        }

        public bool HasLivro(int livroId)
        {
            return Pedido.ItensPedido.Any(ip => ip.LivroId == livroId);
        }

        public void AdicionarFrete(Frete frete)
        {
            Pedido.Frete = frete;
        }
    }
}
