namespace Casadocodigo.Models
{
    public class ItemPedido
    {
        public int LivroId { get; set; }
        public Livro Livro { get; set; }
        public int PedidoId { get; set; }
        public Pedido Pedido { get; set; }
        public int Quantidade { get; set; }
        public decimal Subtotal { get; set; }
    }
}