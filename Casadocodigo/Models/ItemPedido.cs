namespace Casadocodigo.Models
{
    public class ItemPedido
    {
        public int LivroId { get; set; }

        private Livro livro;
        public Livro Livro
        {
            get
            {
                return livro;
            }
            set
            {
                livro = value;
                quantidade = quantidade == 0 ? 1 : quantidade;
                Subtotal = Livro.Precificacao.PrecoUnitario * quantidade;
            }
        }
        public int PedidoId { get; set; }
        public Pedido Pedido { get; set; }

        private int quantidade;
        public int Quantidade
        {
            get
            {
                return quantidade;
            }
            set
            {
                quantidade = value;
                Subtotal = Livro.Precificacao.PrecoUnitario * quantidade;
            }
        }
        public decimal Subtotal { get; set; }
    }
}