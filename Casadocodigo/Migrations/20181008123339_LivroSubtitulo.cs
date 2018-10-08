using Microsoft.EntityFrameworkCore.Migrations;

namespace Casadocodigo.Migrations
{
    public partial class LivroSubtitulo : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Subtitulo",
                table: "Livro",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Subtitulo",
                table: "Livro");
        }
    }
}
