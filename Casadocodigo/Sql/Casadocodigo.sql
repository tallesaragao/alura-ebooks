USE [master]
GO
/****** Object:  Database [CasadocodigoDB]    Script Date: 18/10/2018 10:32:17 ******/
CREATE DATABASE [CasadocodigoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CasadocodigoDB', FILENAME = N'C:\Users\tallesaragao\CasadocodigoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CasadocodigoDB_log', FILENAME = N'C:\Users\tallesaragao\CasadocodigoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CasadocodigoDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CasadocodigoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CasadocodigoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CasadocodigoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CasadocodigoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CasadocodigoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CasadocodigoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CasadocodigoDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CasadocodigoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CasadocodigoDB] SET  MULTI_USER 
GO
ALTER DATABASE [CasadocodigoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CasadocodigoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CasadocodigoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CasadocodigoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CasadocodigoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CasadocodigoDB] SET QUERY_STORE = OFF
GO
USE [CasadocodigoDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CasadocodigoDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18/10/2018 10:32:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](450) NOT NULL,
	[Biografia] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Autor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartaoCredito]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartaoCredito](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomeTitular] [nvarchar](max) NOT NULL,
	[Numero] [nvarchar](max) NOT NULL,
	[Validade] [datetime2](7) NOT NULL,
	[Bandeira] [int] NOT NULL,
	[Codigo] [nvarchar](max) NOT NULL,
	[Ativo] [bit] NOT NULL,
	[ClienteId] [int] NULL,
 CONSTRAINT [PK_CartaoCredito] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](450) NOT NULL,
	[Ativa] [bit] NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](max) NOT NULL,
	[Cpf] [nvarchar](max) NOT NULL,
	[DataNascimento] [datetime2](7) NOT NULL,
	[EnderecoPrincipalId] [int] NOT NULL,
	[DataCadastro] [datetime2](7) NOT NULL,
	[Ativo] [bit] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimensoes]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimensoes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Altura] [decimal](18, 2) NOT NULL,
	[Largura] [decimal](18, 2) NOT NULL,
	[Comprimento] [decimal](18, 2) NOT NULL,
	[Peso] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Dimensoes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cep] [nvarchar](max) NOT NULL,
	[Logradouro] [nvarchar](max) NOT NULL,
	[Numero] [int] NOT NULL,
	[Complemento] [nvarchar](max) NULL,
	[Bairro] [nvarchar](max) NOT NULL,
	[Cidade] [nvarchar](max) NOT NULL,
	[Estado] [nvarchar](max) NOT NULL,
	[Ativo] [bit] NOT NULL,
	[ClienteId] [int] NULL,
 CONSTRAINT [PK_Endereco] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Frete]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Frete](
	[Valor] [decimal](18, 2) NOT NULL,
	[PrazoEntrega] [int] NOT NULL,
	[PedidoId] [int] NOT NULL,
 CONSTRAINT [PK_Frete] PRIMARY KEY CLUSTERED 
(
	[PedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagem]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagem](
	[CaminhoReal] [nvarchar](max) NOT NULL,
	[CaminhoAcesso] [nvarchar](max) NOT NULL,
	[Extensao] [nvarchar](max) NOT NULL,
	[DataCadastro] [datetime2](7) NOT NULL,
	[LivroId] [int] NOT NULL,
 CONSTRAINT [PK_Imagem] PRIMARY KEY CLUSTERED 
(
	[LivroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemPedido]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemPedido](
	[LivroId] [int] NOT NULL,
	[PedidoId] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[Subtotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ItemPedido] PRIMARY KEY CLUSTERED 
(
	[PedidoId] ASC,
	[LivroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Livro]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](450) NOT NULL,
	[Isbn] [nvarchar](450) NOT NULL,
	[Paginas] [int] NOT NULL,
	[Descricao] [nvarchar](max) NOT NULL,
	[DataCadastro] [datetime2](7) NOT NULL,
	[Ativo] [bit] NOT NULL,
	[Subtitulo] [nvarchar](max) NULL,
	[DimensoesId] [int] NOT NULL,
 CONSTRAINT [PK_Livro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LivroAutor]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LivroAutor](
	[LivroId] [int] NOT NULL,
	[AutorId] [int] NOT NULL,
 CONSTRAINT [PK_LivroAutor] PRIMARY KEY CLUSTERED 
(
	[LivroId] ASC,
	[AutorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LivroCategoria]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LivroCategoria](
	[LivroId] [int] NOT NULL,
	[CategoriaId] [int] NOT NULL,
 CONSTRAINT [PK_LivroCategoria] PRIMARY KEY CLUSTERED 
(
	[LivroId] ASC,
	[CategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](max) NULL,
	[ClienteId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[DataRealizacao] [datetime2](7) NOT NULL,
	[Subtotal] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Precificacao]    Script Date: 18/10/2018 10:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Precificacao](
	[PrecoUnitario] [decimal](18, 2) NOT NULL,
	[LivroId] [int] NOT NULL,
 CONSTRAINT [PK_Precificacao] PRIMARY KEY CLUSTERED 
(
	[LivroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181002142908_Inicial', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181002145402_CorrecaoNomesTabelas', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181003150701_CorrecoesAutorCategoria', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181004122703_Imagem', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181004135010_ISBN', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181004142032_LivroAutor', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181004142525_AutorBiografia', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181004150705_RemocaoAutorId', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181005150151_LivroNomeIsbnUnicos', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181005153237_CorrecoesCamposObrigatoriosCartaoCategoria', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181008122519_TituloLivro', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181008123339_LivroSubtitulo', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181018125835_PedidoFrete', N'2.1.4-rtm-31024')
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([Id], [Nome], [Biografia]) VALUES (1, N'Everton Coimbra de Araújo', N'Everton Coimbra de Araújo atua na área de treinamento e desenvolvimento. É tecnólogo em processamento de dados pelo Centro de Ensino superior de Foz do Iguaçu, possui mestrado em Ciência da Computação pela UFSC e doutorado pela UNIOESTE em Engenharia Agrícola. É professor da Universidade Tecnológica Federal do Paraná (UTFPR), Possui experiência na área de Ciência da Computação, com ênfase em Análise e Desenvolvimento de Sistemas, atuando principalmente nos seguintes temas: Desenvolvimento Web com Java e .NET e Persistência de Objetos.')
INSERT [dbo].[Autor] ([Id], [Nome], [Biografia]) VALUES (2, N'Bruna Escudelario', N'Desenvolvedora Web com experiência na área de front-end com as tecnologias e frameworks: HTML5, CSS3, JavaScript, Node.js, Gulp.js, entre outras. Tem bacharelado em Ciência da Computação pela Pontifícia Universidade Católica de São Paulo (PUC-SP) e é entusiasta em desenvolvimento de jogos.')
INSERT [dbo].[Autor] ([Id], [Nome], [Biografia]) VALUES (3, N'Diego Martins de Pinho', N'Diego Martins de Pinho Bacharel em Ciência da Computação pela PUC-SP e MBA em Gestão da Tecnologia da Informação pela FIAP. É aficionado não somente por tecnologia, mas também por empreendedorismo e gestão de negócios. Trabalha com desenvolvimento web desde 2013 e sempre busca tempo para continuar aprendendo e para disseminar o conhecimento.')
INSERT [dbo].[Autor] ([Id], [Nome], [Biografia]) VALUES (4, N'Jonathan Lamim', N'Jonathan Lamim trabalha com desenvolvimento web desde 2005, e é apaixonado pelo o que faz, desde que iniciou trabalho com desenvolvimento de sites, blogs, portais, e-commerce e sistemas web dos mais variados tipos e tamanhos. Dentre as linguagens, frameworks e bancos de dados utilizados estão: HTML, CSS, JS, PHP, MySQL e CodeIgniter. Desde 2010 desenvolve aplicativos mobile para iOS e Android, e em 2014 passou a desenvolver também para Firefox OS. Para o desenvolvimento desses aplicativos, usou as seguintes linguagens e frameworks: Swift, Objective-C, HTML5, CSS3, JS e Apache Cordova. Também escreve artigos e faz palestras, além de ser voluntário do Mozzila, contribuindo para a comunidade.')
INSERT [dbo].[Autor] ([Id], [Nome], [Biografia]) VALUES (5, N'Marcelo Castellani', N'Marcelo Castellani é programador desde quando os computadores eram antissociais e não se comunicavam em rede. Passou grande parte de sua vida desenvolvendo software embarcado de alta performance para automação bancária com C e C++ em empresas como Itautec e OKI, mas também desenvolveu projetos complexos com Java e muito código Ruby. Hoje, é especialista em desenvolvimento de software na TOTVS, uma das maiores empresas de tecnologia do mundo. Interessou-se por Rust quando viu que algumas companhias estavam o utilizando em produção para desenvolver firmware, e desde então tem feito dela sua primeira opção quando é possível.')
INSERT [dbo].[Autor] ([Id], [Nome], [Biografia]) VALUES (6, N'Nelson Fabbri Gerbelli', N'Nelson Fabbri Gerbelli é Tecnólogo em Processamento de Dados pela faculdade FAINAM, pós-graduado em Análise de Sistemas pela faculdade ESAN. Pedagogo e possui licenciatura plena em Informática. É professor em cursos de TI no Centro Estadual de Educação Tecnológica Paula Souza do Estado de São Paulo nas ETECs, atuando principalmente nas seguintes disciplinas: Tecnologia para mobilidade, técnicas de programação para internet e desenvolvimento de softwares com o Visual Studio.Net.')
INSERT [dbo].[Autor] ([Id], [Nome], [Biografia]) VALUES (7, N'Valéria Helena P. Gerbelli', N'Valéria Helena P. Gerbelli é Tecnóloga em Processamento de Dados pela faculdade IESA. Pedagoga e com licenciatura plena em Informática. Pós-graduanda em Educação Profissional e Tecnológica. Professora de Tecnologia da Informação no Centro Estadual de Educação Tecnológica Paula Souza pelo Estado de São Paulo, nas ETECs, atuando principalmente nas seguintes disciplinas: Tecnologia para mobilidade, técnicas de programação para internet e Programação de Computadores.')
INSERT [dbo].[Autor] ([Id], [Nome], [Biografia]) VALUES (8, N'Paulo Siécola', N'Paulo César Siécola é Mestre em Ciência da Computação pelo Instituto de Matemática e Estatística da Universidade de São Paulo (2011). Possui graduação em Engenharia Elétrica pelo Instituto Nacional de Telecomunicações – INATEL (2005). Atualmente, é analista de desenvolvimento de sistemas sênior na WatchGuard e professor em cursos de Pós-Graduação no INATEL. Tem experiência em desenvolvimento de software em C, Java, Swift e C#, atuando principalmente nos seguintes temas: desenvolvimento Web, sistemas embarcados e desenvolvimento de aplicativos móveis para Android e iOS.')
INSERT [dbo].[Autor] ([Id], [Nome], [Biografia]) VALUES (1008, N'Leonardo Vilarinho', N'Leonardo Vilarinho é Analista de Sistemas pelo Instituto Federal do Triângulo Mineiro e desenvolvedor freelancer full-stack. Focado no desenvolvimento web com qualidade, vê que essa área já é o futuro da computação juntamente com a inteligência artificial. É editor do Vue.js Brasil e vive no GitHub entre uma contribuição e outra.')
INSERT [dbo].[Autor] ([Id], [Nome], [Biografia]) VALUES (2008, N'Marcos Brizeno', N'Marcos Brizeno é Cientista da Computação pela Universidade Estadual do Ceará e Consultor na ThoughtWorks Brasil. Apaixonado por Engenharia de Software, em especial Metodologias Ágeis, gosta dos desafios de desenvolver software e se apaixonou à primeira vista por Ruby. Publica regularmente em brizeno.wordpress.com, e gosta de jogar videogames para passar o tempo e ter novas ideias.')
SET IDENTITY_INSERT [dbo].[Autor] OFF
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [Nome], [Ativa]) VALUES (1, N'Programação', 1)
INSERT [dbo].[Categoria] ([Id], [Nome], [Ativa]) VALUES (2, N'Mobile', 1)
INSERT [dbo].[Categoria] ([Id], [Nome], [Ativa]) VALUES (3, N'Front-end', 1)
INSERT [dbo].[Categoria] ([Id], [Nome], [Ativa]) VALUES (4, N'Infraestrutura', 1)
INSERT [dbo].[Categoria] ([Id], [Nome], [Ativa]) VALUES (5, N'Business', 1)
INSERT [dbo].[Categoria] ([Id], [Nome], [Ativa]) VALUES (6, N'Design & UX', 1)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Dimensoes] ON 

INSERT [dbo].[Dimensoes] ([Id], [Altura], [Largura], [Comprimento], [Peso]) VALUES (1, CAST(25.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Dimensoes] ([Id], [Altura], [Largura], [Comprimento], [Peso]) VALUES (2, CAST(25.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Dimensoes] ([Id], [Altura], [Largura], [Comprimento], [Peso]) VALUES (3, CAST(25.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Dimensoes] ([Id], [Altura], [Largura], [Comprimento], [Peso]) VALUES (4, CAST(25.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Dimensoes] ([Id], [Altura], [Largura], [Comprimento], [Peso]) VALUES (5, CAST(25.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Dimensoes] ([Id], [Altura], [Largura], [Comprimento], [Peso]) VALUES (6, CAST(25.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Dimensoes] ([Id], [Altura], [Largura], [Comprimento], [Peso]) VALUES (7, CAST(25.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[Dimensoes] ([Id], [Altura], [Largura], [Comprimento], [Peso]) VALUES (8, CAST(25.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Dimensoes] OFF
INSERT [dbo].[Imagem] ([CaminhoReal], [CaminhoAcesso], [Extensao], [DataCadastro], [LivroId]) VALUES (N'C:\Users\tallesaragao\source\repos\CasaDoCodigo\Casadocodigo\wwwroot\images\produtos\f3a118ee-01b0-40d7-82f1-2364ea7c5f29.jpg', N'~/images/produtos/f3a118ee-01b0-40d7-82f1-2364ea7c5f29.jpg', N'.jpg', CAST(N'2018-10-04T12:08:56.2287473' AS DateTime2), 1)
INSERT [dbo].[Imagem] ([CaminhoReal], [CaminhoAcesso], [Extensao], [DataCadastro], [LivroId]) VALUES (N'C:\Users\tallesaragao\source\repos\CasaDoCodigo\Casadocodigo\wwwroot\images\produtos\3e5f1d2b-108e-49f7-a5ba-30f339ea55a3.jpg', N'~/images/produtos/3e5f1d2b-108e-49f7-a5ba-30f339ea55a3.jpg', N'.jpg', CAST(N'2018-10-04T12:14:44.6948435' AS DateTime2), 2)
INSERT [dbo].[Imagem] ([CaminhoReal], [CaminhoAcesso], [Extensao], [DataCadastro], [LivroId]) VALUES (N'C:\Users\tallesaragao\source\repos\CasaDoCodigo\Casadocodigo\wwwroot\images\produtos\b9a52a86-a684-4a0f-be83-1e644104cedf.jpg', N'~/images/produtos/b9a52a86-a684-4a0f-be83-1e644104cedf.jpg', N'.jpg', CAST(N'2018-10-04T12:25:22.7019903' AS DateTime2), 3)
INSERT [dbo].[Imagem] ([CaminhoReal], [CaminhoAcesso], [Extensao], [DataCadastro], [LivroId]) VALUES (N'C:\Users\tallesaragao\source\repos\CasaDoCodigo\Casadocodigo\wwwroot\images\produtos\22f7155b-5444-495d-9c4a-8d26c24c5941.jpg', N'~/images/produtos/22f7155b-5444-495d-9c4a-8d26c24c5941.jpg', N'.jpg', CAST(N'2018-10-04T12:33:52.5284798' AS DateTime2), 4)
INSERT [dbo].[Imagem] ([CaminhoReal], [CaminhoAcesso], [Extensao], [DataCadastro], [LivroId]) VALUES (N'C:\Users\tallesaragao\source\repos\CasaDoCodigo\Casadocodigo\wwwroot\images\produtos\2d31d581-400d-4e23-8d43-8e60a2cf9136.jpg', N'~/images/produtos/2d31d581-400d-4e23-8d43-8e60a2cf9136.jpg', N'.jpg', CAST(N'2018-10-04T12:38:29.0452876' AS DateTime2), 5)
INSERT [dbo].[Imagem] ([CaminhoReal], [CaminhoAcesso], [Extensao], [DataCadastro], [LivroId]) VALUES (N'C:\Users\tallesaragao\source\repos\Casadocodigo\Casadocodigo\wwwroot\images\produtos\21f6d41d-3071-4678-aa89-3cbe47dfb8c1.jpg', N'~/images/produtos/21f6d41d-3071-4678-aa89-3cbe47dfb8c1.jpg', N'.jpg', CAST(N'2018-10-05T11:23:52.9150421' AS DateTime2), 6)
INSERT [dbo].[Imagem] ([CaminhoReal], [CaminhoAcesso], [Extensao], [DataCadastro], [LivroId]) VALUES (N'C:\Users\tallesaragao\source\repos\Casadocodigo\Casadocodigo\wwwroot\images\produtos\ab43d2c7-10ac-4714-bbd5-04601b4a41d9.jpg', N'~/images/produtos/ab43d2c7-10ac-4714-bbd5-04601b4a41d9.jpg', N'.jpg', CAST(N'2018-10-05T11:37:11.1941836' AS DateTime2), 1006)
INSERT [dbo].[Imagem] ([CaminhoReal], [CaminhoAcesso], [Extensao], [DataCadastro], [LivroId]) VALUES (N'C:\Users\tallesaragao\source\repos\CasaDoCodigo\Casadocodigo\wwwroot\images\produtos\a3be94a5-2053-43ed-a8e7-e9bec9021f4a.jpg', N'~/images/produtos/a3be94a5-2053-43ed-a8e7-e9bec9021f4a.jpg', N'.jpg', CAST(N'2018-10-09T12:41:25.6626453' AS DateTime2), 2006)
SET IDENTITY_INSERT [dbo].[Livro] ON 

INSERT [dbo].[Livro] ([Id], [Titulo], [Isbn], [Paginas], [Descricao], [DataCadastro], [Ativo], [Subtitulo], [DimensoesId]) VALUES (1, N'ASP.NET Core MVC', N'978-85-94188-45-8', 249, N'O ASP.NET Core MVC é um novo framework de código aberto da Microsoft para o desenvolvimento de aplicações web. Ele está dentro do framework .NET Core, o que possibilita a construção e a execução de aplicações em Windows, Mac e Linux. Utilizando como ferramentas o Visual Studio e a linguagem C# para os exemplos, o livro traz implementações que subsidiarão o desenvolvimento de suas próprias aplicações. Os exemplos também introduzem o Bootstrap e trabalham em uma ligação estreita com o Entity Framework Core como ferramenta para persistência de dados.

Neste livro, Everton Coimbra apresenta o ASP.NET Core MVC de uma maneira que o leitor já possa aprender com a prática desde o início. O estudo é dirigido ao desenvolvimento de uma aplicação que envolve persistência em uma base de dados, fazendo uso do Entity Framework Core. Você verá desde as operações CRUD até como desenvolver seus layouts e tabelas, separando sua aplicação em camadas seguindo os conceitos de coesão e acoplamento. Dentre as técnicas e recursos apresentados, estão associações, personalização das classes de modelo, controle de acesso de usuários, tratamento de erros, controles DropDownList aninhados e o uso de sessão para o armazenamento de dados.', CAST(N'2018-10-04T12:08:36.4329293' AS DateTime2), 1, N'Aplicações modernas em conjunto com o Entity Framework', 1)
INSERT [dbo].[Livro] ([Id], [Titulo], [Isbn], [Paginas], [Descricao], [DataCadastro], [Ativo], [Subtitulo], [DimensoesId]) VALUES (2, N'Construct 2', N'978-85-94188-39-7', 227, N'O mercado de jogos no Brasil e o número de pessoas interessadas em ingressar nele não param de crescer. Porém, a maioria das plataformas para produção de jogos exige tanto background tecnológico que acaba desanimando qualquer um. Felizmente, o Construct 2 surgiu pensando no usuário que deseja desenvolver suas próprias ideias, sem a necessidade de possuir algum conhecimento técnico prévio.

Neste livro, Diego e Bruna provam que qualquer um é capaz de construir seus próprios jogos e exportá-los nos mais diversos formatos. Você verá como funcionam todos os mecanismos para criar um jogo de plataforma completo, com todas as telas, sistema de inimigos e movimentação dos personagens, que funcionará tanto em navegadores como em celulares!', CAST(N'2018-10-04T12:14:44.6872759' AS DateTime2), 1, N'Crie o seu primeiro jogo multiplataforma', 2)
INSERT [dbo].[Livro] ([Id], [Titulo], [Isbn], [Paginas], [Descricao], [DataCadastro], [Ativo], [Subtitulo], [DimensoesId]) VALUES (3, N'Marketing de Conteúdo', N'978-85-94188-36-6', 213, N'Em um mundo no qual tudo é informação, saber entregá-la no melhor formato ao seu público é uma das chaves do sucesso para uma estratégia de marketing de conteúdo. Através dele, as marcas podem, além de conhecer melhor o seu público, entregar exatamente o que ele quer consumir, tanto no que diz respeito ao conteúdo como ao produto.

Neste livro, Jonathan Lamim compartilha seus conhecimentos sobre marketing de conteúdo para que você possa realizar um trabalho de qualidade e que gere resultados, seja como um consultor freelancer, atuando dentro de alguma empresa de marketing, ou no setor de marketing de empresas de outros ramos. Você verá como desenvolver técnicas como estudos de personas e fatores de ranqueamento de SEO, junto das melhores estratégias para criar conteúdo de valor e medir os resultados de seu plano de marketing.', CAST(N'2018-10-04T12:25:22.6910698' AS DateTime2), 1, N'Estratégias para entregar o que o seu público quer consumir', 3)
INSERT [dbo].[Livro] ([Id], [Titulo], [Isbn], [Paginas], [Descricao], [DataCadastro], [Ativo], [Subtitulo], [DimensoesId]) VALUES (4, N'Rust', N'978-85-94188-33-5', 237, N'Quando falamos em linguagens de programação voltadas à construção de sistemas que exigem performance e agilidade, Rust tem ganhado muita notoriedade. Ela foi feita para ser segura a ponto de possibilitar uma concorrência limpa sem a famigerada race condition. Trata-se de uma linguagem open source multiparadigma, sendo uma ótima alternativa ao C++.

Neste livro, Marcelo Castellani mostra por que Rust encaixa-se perfeitamente neste momento de busca por tecnologias capazes de efetuar processamento rápido e paralelo, para o desenvolvimento de ferramentas que exigem performance, como sistemas embarcados e aplicativos de servidor. Você vai aprender na prática conceitos como traits, vetores, generics, macros, entre outros, chegando aos testes e à compilação final do código. Com Rust, você será capaz de escrever sistemas complexos, de alta performance, robustos e seguros.', CAST(N'2018-10-04T12:33:52.5186630' AS DateTime2), 1, N'Concorrência e alta performance com segurança', 4)
INSERT [dbo].[Livro] ([Id], [Titulo], [Isbn], [Paginas], [Descricao], [DataCadastro], [Ativo], [Subtitulo], [DimensoesId]) VALUES (5, N'App Inventor', N'978-85-94188-30-4', 313, N'O App Inventor 2 é uma ferramenta inovadora, desenvolvida pelo Google e mantida hoje pelo Instituto de Tecnologia de Massachusetts (MIT). Com ela, é possível criar aplicativos para dispositivos móveis Android, por meio de uma linguagem visual, sem precisar decorar ou escrever códigos de linguagem de programação. Com um simples arrastar e inserir blocos para a área de programação, em uma interface intuitiva, é uma excelente ferramenta de aprendizado que permite que os recém-chegados à programação de computador criem aplicativos completos.

Neste livro, Nelson e Valéria Gerbelli têm como objetivo proporcionar aos estudantes, educadores e entusiastas por tecnologia o primeiro passo no mundo da programação para dispositivos móveis por meio do App Inventor. Após ser apresentado ao ambiente, você aprenderá na prática a desenvolver alguns aplicativos do zero, partindo de alguns cálculos, até chegar a resultados mais complexos, com um recurso de localização de GPS, tradução de idioma e desenvolvendo um projeto final completo. Dentre as funcionalidades, estão o compartilhamento com outros aplicativos como o WhatsApp, a conexão a um banco de dados em MySQL, e a disponibilização do aplicativo na loja do Google Play Store.', CAST(N'2018-10-04T12:38:29.0357804' AS DateTime2), 1, N'Seus primeiros aplicativos Android', 5)
INSERT [dbo].[Livro] ([Id], [Titulo], [Isbn], [Paginas], [Descricao], [DataCadastro], [Ativo], [Subtitulo], [DimensoesId]) VALUES (6, N'Google App Engine', N'978-85-5519-159-6', 256, N'O Google App Engine é uma plataforma de computação em nuvem que permite a execução de aplicações Web na infraestrutura do Google. Tudo isso de forma fácil e escalável, com várias opções de utilização gratuitas e sem a necessidade de manutenção em sistemas operacionais ou servidores.

Nesta edição atualizada, Paulo Siécola aborda os aspectos dessa plataforma utilizando Spring Boot - principalmente aqueles relacionados ao desenvolvimento de aplicações em Java. Você verá como interagir com seus recursos, além de como administrá-los por meio das ferramentas disponibilizadas pelo Google App Engine, ou GAE, como é comumente chamado.

Versões utilizadas: Java 8, Google App Engine Standard Environment com SDK 1.9 e Spring Boot versão 1.5.9.', CAST(N'2018-10-05T11:23:52.9066100' AS DateTime2), 1, N'Construindo serviços na nuvem', 6)
INSERT [dbo].[Livro] ([Id], [Titulo], [Isbn], [Paginas], [Descricao], [DataCadastro], [Ativo], [Subtitulo], [DimensoesId]) VALUES (1006, N'Front-end com Vue.js', N'978-85-94188-27-4', 215, N'Se você acha que é preciso muito tempo e códigos HTML, CSS e JavaScript embolados para conseguir construir um layout moderno e interativo, com um curto tempo de carregamento e funcionamento em qualquer plataforma, com certeza não conhece o Vue.js. Ele é um framework feito em JavaScript, que tem como principal objetivo o reaproveitamento de código e uma curva de aprendizagem pequena.

Neste livro, Leonardo Vilarinho traz um guia de consulta com exercícios práticos ao final de cada capítulo. Você verá uma documentação mais compacta do Vue.js, para conhecer esse framework sem complicações. Você aprenderá a inserir, exibir e manipular dados, usar e reutilizar componentes, criar rotas, diretivas e plugins personalizados, gerenciar estados, e fazer testes automatizados. Ao final, você vai construir uma aplicação usando o que foi visto, uma API feita com o Laravel e o runner de testes AVA.', CAST(N'2018-10-05T11:37:11.1850708' AS DateTime2), 1, N'Da teoria à prática sem complicações', 7)
INSERT [dbo].[Livro] ([Id], [Titulo], [Isbn], [Paginas], [Descricao], [DataCadastro], [Ativo], [Subtitulo], [DimensoesId]) VALUES (2006, N'Refatorando com padrões de projeto', N'978-85-94188-21-2', 142, N'Qualidade de código e refatoração são reconhecidamente assuntos que permanecem relevantes e pertinentes tanto para novos profissionais como para quem já sabe do que se trata: melhorar o design existente, aplicar mudanças em pequenos passos e evitar deixar o sistema quebrado. Ao aplicar refatorações, existem várias técnicas que podem ajudar a alcançar a melhoria desejada, de modo que o processo seja feito de maneira responsável e garantindo o funcionamento da aplicação por meio de testes unitários.

Neste livro, Marcos Brizeno mostra como padrões de projeto podem servir como guias para a refatoração projetos Java, para que você saiba decidir quando ou não determinado padrão pode ser aplicado para alcançar o código ideal. Por meio de exemplos práticos, você terá um melhor entendimento sobre design orientado a objetos, permitindo identificar mais facilmente os problemas e implementar soluções flexíveis e fáceis de evoluir.', CAST(N'2018-10-09T12:41:24.0267132' AS DateTime2), 1, N'Um guia em Java', 8)
SET IDENTITY_INSERT [dbo].[Livro] OFF
INSERT [dbo].[LivroAutor] ([LivroId], [AutorId]) VALUES (1, 1)
INSERT [dbo].[LivroAutor] ([LivroId], [AutorId]) VALUES (2, 2)
INSERT [dbo].[LivroAutor] ([LivroId], [AutorId]) VALUES (2, 3)
INSERT [dbo].[LivroAutor] ([LivroId], [AutorId]) VALUES (3, 4)
INSERT [dbo].[LivroAutor] ([LivroId], [AutorId]) VALUES (4, 5)
INSERT [dbo].[LivroAutor] ([LivroId], [AutorId]) VALUES (5, 6)
INSERT [dbo].[LivroAutor] ([LivroId], [AutorId]) VALUES (5, 7)
INSERT [dbo].[LivroAutor] ([LivroId], [AutorId]) VALUES (6, 8)
INSERT [dbo].[LivroAutor] ([LivroId], [AutorId]) VALUES (1006, 1008)
INSERT [dbo].[LivroAutor] ([LivroId], [AutorId]) VALUES (2006, 2008)
INSERT [dbo].[LivroCategoria] ([LivroId], [CategoriaId]) VALUES (1, 1)
INSERT [dbo].[LivroCategoria] ([LivroId], [CategoriaId]) VALUES (2, 1)
INSERT [dbo].[LivroCategoria] ([LivroId], [CategoriaId]) VALUES (4, 1)
INSERT [dbo].[LivroCategoria] ([LivroId], [CategoriaId]) VALUES (5, 1)
INSERT [dbo].[LivroCategoria] ([LivroId], [CategoriaId]) VALUES (2006, 1)
INSERT [dbo].[LivroCategoria] ([LivroId], [CategoriaId]) VALUES (5, 2)
INSERT [dbo].[LivroCategoria] ([LivroId], [CategoriaId]) VALUES (1, 3)
INSERT [dbo].[LivroCategoria] ([LivroId], [CategoriaId]) VALUES (1006, 3)
INSERT [dbo].[LivroCategoria] ([LivroId], [CategoriaId]) VALUES (6, 4)
INSERT [dbo].[LivroCategoria] ([LivroId], [CategoriaId]) VALUES (3, 5)
INSERT [dbo].[Precificacao] ([PrecoUnitario], [LivroId]) VALUES (CAST(39.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[Precificacao] ([PrecoUnitario], [LivroId]) VALUES (CAST(49.90 AS Decimal(18, 2)), 2)
INSERT [dbo].[Precificacao] ([PrecoUnitario], [LivroId]) VALUES (CAST(29.90 AS Decimal(18, 2)), 3)
INSERT [dbo].[Precificacao] ([PrecoUnitario], [LivroId]) VALUES (CAST(29.90 AS Decimal(18, 2)), 4)
INSERT [dbo].[Precificacao] ([PrecoUnitario], [LivroId]) VALUES (CAST(29.90 AS Decimal(18, 2)), 5)
INSERT [dbo].[Precificacao] ([PrecoUnitario], [LivroId]) VALUES (CAST(24.90 AS Decimal(18, 2)), 6)
INSERT [dbo].[Precificacao] ([PrecoUnitario], [LivroId]) VALUES (CAST(29.90 AS Decimal(18, 2)), 1006)
INSERT [dbo].[Precificacao] ([PrecoUnitario], [LivroId]) VALUES (CAST(29.90 AS Decimal(18, 2)), 2006)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Autor_Nome]    Script Date: 18/10/2018 10:32:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Autor_Nome] ON [dbo].[Autor]
(
	[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartaoCredito_ClienteId]    Script Date: 18/10/2018 10:32:18 ******/
CREATE NONCLUSTERED INDEX [IX_CartaoCredito_ClienteId] ON [dbo].[CartaoCredito]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categoria_Nome]    Script Date: 18/10/2018 10:32:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categoria_Nome] ON [dbo].[Categoria]
(
	[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cliente_EnderecoPrincipalId]    Script Date: 18/10/2018 10:32:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cliente_EnderecoPrincipalId] ON [dbo].[Cliente]
(
	[EnderecoPrincipalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Endereco_ClienteId]    Script Date: 18/10/2018 10:32:18 ******/
CREATE NONCLUSTERED INDEX [IX_Endereco_ClienteId] ON [dbo].[Endereco]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemPedido_LivroId]    Script Date: 18/10/2018 10:32:18 ******/
CREATE NONCLUSTERED INDEX [IX_ItemPedido_LivroId] ON [dbo].[ItemPedido]
(
	[LivroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Livro_DimensoesId]    Script Date: 18/10/2018 10:32:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Livro_DimensoesId] ON [dbo].[Livro]
(
	[DimensoesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Livro_Isbn]    Script Date: 18/10/2018 10:32:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Livro_Isbn] ON [dbo].[Livro]
(
	[Isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Livro_Titulo]    Script Date: 18/10/2018 10:32:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Livro_Titulo] ON [dbo].[Livro]
(
	[Titulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LivroAutor_AutorId]    Script Date: 18/10/2018 10:32:18 ******/
CREATE NONCLUSTERED INDEX [IX_LivroAutor_AutorId] ON [dbo].[LivroAutor]
(
	[AutorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LivroCategoria_CategoriaId]    Script Date: 18/10/2018 10:32:18 ******/
CREATE NONCLUSTERED INDEX [IX_LivroCategoria_CategoriaId] ON [dbo].[LivroCategoria]
(
	[CategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pedido_ClienteId]    Script Date: 18/10/2018 10:32:18 ******/
CREATE NONCLUSTERED INDEX [IX_Pedido_ClienteId] ON [dbo].[Pedido]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Autor] ADD  DEFAULT (N'') FOR [Biografia]
GO
ALTER TABLE [dbo].[Livro] ADD  DEFAULT ((0)) FOR [DimensoesId]
GO
ALTER TABLE [dbo].[Pedido] ADD  DEFAULT ((0.0)) FOR [Subtotal]
GO
ALTER TABLE [dbo].[Pedido] ADD  DEFAULT ((0.0)) FOR [Total]
GO
ALTER TABLE [dbo].[CartaoCredito]  WITH CHECK ADD  CONSTRAINT [FK_CartaoCredito_Cliente_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[CartaoCredito] CHECK CONSTRAINT [FK_CartaoCredito_Cliente_ClienteId]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Endereco_EnderecoPrincipalId] FOREIGN KEY([EnderecoPrincipalId])
REFERENCES [dbo].[Endereco] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Endereco_EnderecoPrincipalId]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [FK_Endereco_Cliente_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [FK_Endereco_Cliente_ClienteId]
GO
ALTER TABLE [dbo].[Frete]  WITH CHECK ADD  CONSTRAINT [FK_Frete_Pedido_PedidoId] FOREIGN KEY([PedidoId])
REFERENCES [dbo].[Pedido] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Frete] CHECK CONSTRAINT [FK_Frete_Pedido_PedidoId]
GO
ALTER TABLE [dbo].[Imagem]  WITH CHECK ADD  CONSTRAINT [FK_Imagem_Livro_LivroId] FOREIGN KEY([LivroId])
REFERENCES [dbo].[Livro] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Imagem] CHECK CONSTRAINT [FK_Imagem_Livro_LivroId]
GO
ALTER TABLE [dbo].[ItemPedido]  WITH CHECK ADD  CONSTRAINT [FK_ItemPedido_Livro_LivroId] FOREIGN KEY([LivroId])
REFERENCES [dbo].[Livro] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemPedido] CHECK CONSTRAINT [FK_ItemPedido_Livro_LivroId]
GO
ALTER TABLE [dbo].[ItemPedido]  WITH CHECK ADD  CONSTRAINT [FK_ItemPedido_Pedido_PedidoId] FOREIGN KEY([PedidoId])
REFERENCES [dbo].[Pedido] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemPedido] CHECK CONSTRAINT [FK_ItemPedido_Pedido_PedidoId]
GO
ALTER TABLE [dbo].[Livro]  WITH CHECK ADD  CONSTRAINT [FK_Livro_Dimensoes_DimensoesId] FOREIGN KEY([DimensoesId])
REFERENCES [dbo].[Dimensoes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Livro] CHECK CONSTRAINT [FK_Livro_Dimensoes_DimensoesId]
GO
ALTER TABLE [dbo].[LivroAutor]  WITH CHECK ADD  CONSTRAINT [FK_LivroAutor_Autor_AutorId] FOREIGN KEY([AutorId])
REFERENCES [dbo].[Autor] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LivroAutor] CHECK CONSTRAINT [FK_LivroAutor_Autor_AutorId]
GO
ALTER TABLE [dbo].[LivroAutor]  WITH CHECK ADD  CONSTRAINT [FK_LivroAutor_Livro_LivroId] FOREIGN KEY([LivroId])
REFERENCES [dbo].[Livro] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LivroAutor] CHECK CONSTRAINT [FK_LivroAutor_Livro_LivroId]
GO
ALTER TABLE [dbo].[LivroCategoria]  WITH CHECK ADD  CONSTRAINT [FK_LivroCategoria_Categoria_CategoriaId] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categoria] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LivroCategoria] CHECK CONSTRAINT [FK_LivroCategoria_Categoria_CategoriaId]
GO
ALTER TABLE [dbo].[LivroCategoria]  WITH CHECK ADD  CONSTRAINT [FK_LivroCategoria_Livro_LivroId] FOREIGN KEY([LivroId])
REFERENCES [dbo].[Livro] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LivroCategoria] CHECK CONSTRAINT [FK_LivroCategoria_Livro_LivroId]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Cliente_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Cliente_ClienteId]
GO
ALTER TABLE [dbo].[Precificacao]  WITH CHECK ADD  CONSTRAINT [FK_Precificacao_Livro_LivroId] FOREIGN KEY([LivroId])
REFERENCES [dbo].[Livro] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Precificacao] CHECK CONSTRAINT [FK_Precificacao_Livro_LivroId]
GO
USE [master]
GO
ALTER DATABASE [CasadocodigoDB] SET  READ_WRITE 
GO
