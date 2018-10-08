using Microsoft.EntityFrameworkCore.Migrations;

namespace Casadocodigo.Migrations
{
    public partial class TituloLivro : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Nome",
                table: "Livro",
                newName: "Titulo");

            migrationBuilder.RenameIndex(
                name: "IX_Livro_Nome",
                table: "Livro",
                newName: "IX_Livro_Titulo");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Titulo",
                table: "Livro",
                newName: "Nome");

            migrationBuilder.RenameIndex(
                name: "IX_Livro_Titulo",
                table: "Livro",
                newName: "IX_Livro_Nome");
        }
    }
}
