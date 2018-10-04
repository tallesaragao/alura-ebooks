using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Casadocodigo.Migrations
{
    public partial class Imagem : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Imagem",
                table: "Livro");

            migrationBuilder.CreateTable(
                name: "Imagem",
                columns: table => new
                {
                    CaminhoReal = table.Column<string>(nullable: false),
                    CaminhoAcesso = table.Column<string>(nullable: false),
                    Extensao = table.Column<string>(nullable: false),
                    DataCadastro = table.Column<DateTime>(nullable: false),
                    LivroId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Imagem", x => x.LivroId);
                    table.ForeignKey(
                        name: "FK_Imagem_Livro_LivroId",
                        column: x => x.LivroId,
                        principalTable: "Livro",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Imagem");

            migrationBuilder.AddColumn<string>(
                name: "Imagem",
                table: "Livro",
                nullable: true);
        }
    }
}
