using Casadocodigo.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.DbContexts
{
    public class ApplicationContext : DbContext
    {
        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Livro> Livros { get; set; }
        public DbSet<Pedido> Pedidos { get; set; }
        public DbSet<Autor> Autores { get; set; }
        public DbSet<Endereco> Enderecos { get; set; }
        public DbSet<CartaoCredito> CartoesCredito { get; set; }
        public DbSet<Categoria> Categorias { get; set; }

        public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Pedido>()
                .ToTable("Pedido");

            modelBuilder.Entity<Categoria>()
                .ToTable("Categoria")
                .Property(c => c.Nome)
                .IsRequired();

            modelBuilder.Entity<ItemPedido>()
                .ToTable("ItemPedido")
                .HasKey(ip => new { ip.PedidoId, ip.LivroId });

            modelBuilder.Entity<Cliente>()
                .ToTable("Cliente")
                .HasOne(c => c.EnderecoPrincipal)
                .WithOne()
                .HasForeignKey<Cliente>(c => c.EnderecoPrincipalId);
            modelBuilder.Entity<Cliente>()
                .Property(c => c.Nome)
                .IsRequired();
            modelBuilder.Entity<Cliente>()
                .Property(c => c.Cpf)
                .IsRequired();
            modelBuilder.Entity<Cliente>()
                .HasMany(c => c.Enderecos)
                .WithOne();
            modelBuilder.Entity<Cliente>()
                .HasMany(c => c.CartoesCredito)
                .WithOne();

            modelBuilder.Entity<Imagem>()
                .Property<int>("LivroId");
            modelBuilder.Entity<Imagem>()
                .HasKey("LivroId");

            modelBuilder.Entity<Livro>()
                .ToTable("Livro")
                .HasOne(l => l.Precificacao)
                .WithOne()
                .IsRequired();
            modelBuilder.Entity<Livro>()
                .HasOne(l => l.Imagem)
                .WithOne()
                .IsRequired();
            modelBuilder.Entity<Livro>()
                .Property(l => l.Nome)
                .IsRequired();
            modelBuilder.Entity<Livro>()
                .Property(l => l.Descricao)
                .IsRequired();
            modelBuilder.Entity<Livro>()
                .Property(l => l.Isbn)
                .IsRequired();

            modelBuilder.Entity<CartaoCredito>()
                .ToTable("CartaoCredito");

            modelBuilder.Entity<Autor>()
                .ToTable("Autor")
                .HasIndex(a => a.Nome)
                .IsUnique();

            modelBuilder.Entity<Autor>()
                .Property(a => a.Nome)
                .IsRequired();

            modelBuilder.Entity<Autor>()
                .Property(a => a.Biografia)
                .IsRequired();

            modelBuilder.Entity<LivroCategoria>()
                .ToTable("LivroCategoria")
                .HasKey(lc => new { lc.LivroId, lc.CategoriaId });

            modelBuilder.Entity<LivroAutor>()
                .ToTable("LivroAutor")
                .HasKey(la => new { la.LivroId, la.AutorId });

            modelBuilder.Entity<Precificacao>()
                .ToTable("Precificacao")
                .Property<int>("LivroId");
            modelBuilder.Entity<Precificacao>()
                .HasKey("LivroId");

            modelBuilder.Entity<Endereco>()
                .ToTable("Endereco")
                .Property(e => e.Bairro)
                .IsRequired();
            modelBuilder.Entity<Endereco>()
                .Property(e => e.Cidade)
                .IsRequired();
            modelBuilder.Entity<Endereco>()
                .Property(e => e.Logradouro)
                .IsRequired();
            modelBuilder.Entity<Endereco>()
                .Property(e => e.Cep)
                .IsRequired();
            modelBuilder.Entity<Endereco>()
                .Property(e => e.Estado)
                .IsRequired();


        }
    }
}
