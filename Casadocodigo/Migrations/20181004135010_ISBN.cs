using Microsoft.EntityFrameworkCore.Migrations;

namespace Casadocodigo.Migrations
{
    public partial class ISBN : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Codigo",
                table: "Livro",
                newName: "Isbn");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Isbn",
                table: "Livro",
                newName: "Codigo");
        }
    }
}
