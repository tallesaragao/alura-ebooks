using Microsoft.EntityFrameworkCore.Migrations;

namespace Casadocodigo.Migrations
{
    public partial class LivroNomeIsbnUnicos : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Nome",
                table: "Livro",
                nullable: false,
                oldClrType: typeof(string));

            migrationBuilder.AlterColumn<string>(
                name: "Isbn",
                table: "Livro",
                nullable: false,
                oldClrType: typeof(string));

            migrationBuilder.CreateIndex(
                name: "IX_Livro_Isbn",
                table: "Livro",
                column: "Isbn",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Livro_Nome",
                table: "Livro",
                column: "Nome",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Livro_Isbn",
                table: "Livro");

            migrationBuilder.DropIndex(
                name: "IX_Livro_Nome",
                table: "Livro");

            migrationBuilder.AlterColumn<string>(
                name: "Nome",
                table: "Livro",
                nullable: false,
                oldClrType: typeof(string));

            migrationBuilder.AlterColumn<string>(
                name: "Isbn",
                table: "Livro",
                nullable: false,
                oldClrType: typeof(string));
        }
    }
}
