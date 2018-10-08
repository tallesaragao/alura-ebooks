﻿// <auto-generated />
using System;
using Casadocodigo.DbContexts;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Casadocodigo.Migrations
{
    [DbContext(typeof(ApplicationContext))]
    partial class ApplicationContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.1.4-rtm-31024")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Casadocodigo.Models.Autor", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Biografia")
                        .IsRequired();

                    b.Property<string>("Nome")
                        .IsRequired();

                    b.HasKey("Id");

                    b.HasIndex("Nome")
                        .IsUnique();

                    b.ToTable("Autor");
                });

            modelBuilder.Entity("Casadocodigo.Models.CartaoCredito", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<bool>("Ativo");

                    b.Property<int>("Bandeira");

                    b.Property<int?>("ClienteId");

                    b.Property<string>("Codigo")
                        .IsRequired();

                    b.Property<string>("NomeTitular")
                        .IsRequired();

                    b.Property<string>("Numero")
                        .IsRequired();

                    b.Property<DateTime>("Validade");

                    b.HasKey("Id");

                    b.HasIndex("ClienteId");

                    b.ToTable("CartaoCredito");
                });

            modelBuilder.Entity("Casadocodigo.Models.Categoria", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<bool>("Ativa");

                    b.Property<string>("Nome")
                        .IsRequired();

                    b.HasKey("Id");

                    b.HasIndex("Nome")
                        .IsUnique();

                    b.ToTable("Categoria");
                });

            modelBuilder.Entity("Casadocodigo.Models.Cliente", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<bool>("Ativo");

                    b.Property<string>("Cpf")
                        .IsRequired();

                    b.Property<DateTime>("DataCadastro");

                    b.Property<DateTime>("DataNascimento");

                    b.Property<int>("EnderecoPrincipalId");

                    b.Property<string>("Nome")
                        .IsRequired();

                    b.HasKey("Id");

                    b.HasIndex("EnderecoPrincipalId")
                        .IsUnique();

                    b.ToTable("Cliente");
                });

            modelBuilder.Entity("Casadocodigo.Models.Endereco", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<bool>("Ativo");

                    b.Property<string>("Bairro")
                        .IsRequired();

                    b.Property<string>("Cep")
                        .IsRequired();

                    b.Property<string>("Cidade")
                        .IsRequired();

                    b.Property<int?>("ClienteId");

                    b.Property<string>("Complemento");

                    b.Property<string>("Estado")
                        .IsRequired();

                    b.Property<string>("Logradouro")
                        .IsRequired();

                    b.Property<int>("Numero");

                    b.HasKey("Id");

                    b.HasIndex("ClienteId");

                    b.ToTable("Endereco");
                });

            modelBuilder.Entity("Casadocodigo.Models.Imagem", b =>
                {
                    b.Property<int>("LivroId");

                    b.Property<string>("CaminhoAcesso")
                        .IsRequired();

                    b.Property<string>("CaminhoReal")
                        .IsRequired();

                    b.Property<DateTime>("DataCadastro");

                    b.Property<string>("Extensao")
                        .IsRequired();

                    b.HasKey("LivroId");

                    b.ToTable("Imagem");
                });

            modelBuilder.Entity("Casadocodigo.Models.ItemPedido", b =>
                {
                    b.Property<int>("PedidoId");

                    b.Property<int>("LivroId");

                    b.Property<int>("Quantidade");

                    b.Property<decimal>("Subtotal");

                    b.HasKey("PedidoId", "LivroId");

                    b.HasIndex("LivroId");

                    b.ToTable("ItemPedido");
                });

            modelBuilder.Entity("Casadocodigo.Models.Livro", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<bool>("Ativo");

                    b.Property<DateTime>("DataCadastro");

                    b.Property<string>("Descricao")
                        .IsRequired();

                    b.Property<string>("Isbn")
                        .IsRequired();

                    b.Property<int>("Paginas");

                    b.Property<string>("Subtitulo");

                    b.Property<string>("Titulo")
                        .IsRequired();

                    b.HasKey("Id");

                    b.HasIndex("Isbn")
                        .IsUnique();

                    b.HasIndex("Titulo")
                        .IsUnique();

                    b.ToTable("Livro");
                });

            modelBuilder.Entity("Casadocodigo.Models.LivroAutor", b =>
                {
                    b.Property<int>("LivroId");

                    b.Property<int>("AutorId");

                    b.HasKey("LivroId", "AutorId");

                    b.HasIndex("AutorId");

                    b.ToTable("LivroAutor");
                });

            modelBuilder.Entity("Casadocodigo.Models.LivroCategoria", b =>
                {
                    b.Property<int>("LivroId");

                    b.Property<int>("CategoriaId");

                    b.HasKey("LivroId", "CategoriaId");

                    b.HasIndex("CategoriaId");

                    b.ToTable("LivroCategoria");
                });

            modelBuilder.Entity("Casadocodigo.Models.Pedido", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("ClienteId");

                    b.Property<string>("Codigo");

                    b.Property<DateTime>("DataRealizacao");

                    b.Property<int>("Status");

                    b.HasKey("Id");

                    b.HasIndex("ClienteId");

                    b.ToTable("Pedido");
                });

            modelBuilder.Entity("Casadocodigo.Models.Precificacao", b =>
                {
                    b.Property<int>("LivroId");

                    b.Property<decimal>("PrecoUnitario");

                    b.HasKey("LivroId");

                    b.ToTable("Precificacao");
                });

            modelBuilder.Entity("Casadocodigo.Models.CartaoCredito", b =>
                {
                    b.HasOne("Casadocodigo.Models.Cliente")
                        .WithMany("CartoesCredito")
                        .HasForeignKey("ClienteId");
                });

            modelBuilder.Entity("Casadocodigo.Models.Cliente", b =>
                {
                    b.HasOne("Casadocodigo.Models.Endereco", "EnderecoPrincipal")
                        .WithOne()
                        .HasForeignKey("Casadocodigo.Models.Cliente", "EnderecoPrincipalId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Casadocodigo.Models.Endereco", b =>
                {
                    b.HasOne("Casadocodigo.Models.Cliente")
                        .WithMany("Enderecos")
                        .HasForeignKey("ClienteId");
                });

            modelBuilder.Entity("Casadocodigo.Models.Imagem", b =>
                {
                    b.HasOne("Casadocodigo.Models.Livro")
                        .WithOne("Imagem")
                        .HasForeignKey("Casadocodigo.Models.Imagem", "LivroId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Casadocodigo.Models.ItemPedido", b =>
                {
                    b.HasOne("Casadocodigo.Models.Livro", "Livro")
                        .WithMany()
                        .HasForeignKey("LivroId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("Casadocodigo.Models.Pedido", "Pedido")
                        .WithMany("ItensPedido")
                        .HasForeignKey("PedidoId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Casadocodigo.Models.LivroAutor", b =>
                {
                    b.HasOne("Casadocodigo.Models.Autor", "Autor")
                        .WithMany("Livros")
                        .HasForeignKey("AutorId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("Casadocodigo.Models.Livro", "Livro")
                        .WithMany("Autores")
                        .HasForeignKey("LivroId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Casadocodigo.Models.LivroCategoria", b =>
                {
                    b.HasOne("Casadocodigo.Models.Categoria", "Categoria")
                        .WithMany("Livros")
                        .HasForeignKey("CategoriaId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("Casadocodigo.Models.Livro", "Livro")
                        .WithMany("Categorias")
                        .HasForeignKey("LivroId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Casadocodigo.Models.Pedido", b =>
                {
                    b.HasOne("Casadocodigo.Models.Cliente", "Cliente")
                        .WithMany("Pedidos")
                        .HasForeignKey("ClienteId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Casadocodigo.Models.Precificacao", b =>
                {
                    b.HasOne("Casadocodigo.Models.Livro")
                        .WithOne("Precificacao")
                        .HasForeignKey("Casadocodigo.Models.Precificacao", "LivroId")
                        .OnDelete(DeleteBehavior.Cascade);
                });
#pragma warning restore 612, 618
        }
    }
}
