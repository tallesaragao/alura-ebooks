using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Casadocodigo.Migrations
{
    public partial class PedidoFrete : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "Subtotal",
                table: "Pedido",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<decimal>(
                name: "Total",
                table: "Pedido",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<int>(
                name: "DimensoesId",
                table: "Livro",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Dimensoes",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Altura = table.Column<decimal>(nullable: false),
                    Largura = table.Column<decimal>(nullable: false),
                    Comprimento = table.Column<decimal>(nullable: false),
                    Peso = table.Column<decimal>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dimensoes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Frete",
                columns: table => new
                {
                    Valor = table.Column<decimal>(nullable: false),
                    PrazoEntrega = table.Column<int>(nullable: false),
                    PedidoId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Frete", x => x.PedidoId);
                    table.ForeignKey(
                        name: "FK_Frete_Pedido_PedidoId",
                        column: x => x.PedidoId,
                        principalTable: "Pedido",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Livro_DimensoesId",
                table: "Livro",
                column: "DimensoesId",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Livro_Dimensoes_DimensoesId",
                table: "Livro",
                column: "DimensoesId",
                principalTable: "Dimensoes",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Livro_Dimensoes_DimensoesId",
                table: "Livro");

            migrationBuilder.DropTable(
                name: "Dimensoes");

            migrationBuilder.DropTable(
                name: "Frete");

            migrationBuilder.DropIndex(
                name: "IX_Livro_DimensoesId",
                table: "Livro");

            migrationBuilder.DropColumn(
                name: "Subtotal",
                table: "Pedido");

            migrationBuilder.DropColumn(
                name: "Total",
                table: "Pedido");

            migrationBuilder.DropColumn(
                name: "DimensoesId",
                table: "Livro");
        }
    }
}
