CREATE DATABASE  IF NOT EXISTS `localdb` ;
USE `localdb`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: localdb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20181019121442_InicialMySql','2.1.4-rtm-31024'),('20181019130613_PrecisaoDecimal','2.1.4-rtm-31024');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `autor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Biografia` longtext NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Autor_Nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=2009 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Everton Coimbra de Araújo','Everton Coimbra de Araújo atua na área de treinamento e desenvolvimento. É tecnólogo em processamento de dados pelo Centro de Ensino superior de Foz do Iguaçu, possui mestrado em Ciência da Computação pela UFSC e doutorado pela UNIOESTE em Engenharia Agrícola. É professor da Universidade Tecnológica Federal do Paraná (UTFPR), Possui experiência na área de Ciência da Computação, com ênfase em Análise e Desenvolvimento de Sistemas, atuando principalmente nos seguintes temas: Desenvolvimento Web com Java e .NET e Persistência de Objetos.'),(2,'Bruna Escudelario','Desenvolvedora Web com experiência na área de front-end com as tecnologias e frameworks: HTML5, CSS3, JavaScript, Node.js, Gulp.js, entre outras. Tem bacharelado em Ciência da Computação pela Pontifícia Universidade Católica de São Paulo (PUC-SP) e é entusiasta em desenvolvimento de jogos.'),(3,'Diego Martins de Pinho','Diego Martins de Pinho Bacharel em Ciência da Computação pela PUC-SP e MBA em Gestão da Tecnologia da Informação pela FIAP. É aficionado não somente por tecnologia, mas também por empreendedorismo e gestão de negócios. Trabalha com desenvolvimento web desde 2013 e sempre busca tempo para continuar aprendendo e para disseminar o conhecimento.'),(4,'Jonathan Lamim','Jonathan Lamim trabalha com desenvolvimento web desde 2005, e é apaixonado pelo o que faz, desde que iniciou trabalho com desenvolvimento de sites, blogs, portais, e-commerce e sistemas web dos mais variados tipos e tamanhos. Dentre as linguagens, frameworks e bancos de dados utilizados estão: HTML, CSS, JS, PHP, MySQL e CodeIgniter. Desde 2010 desenvolve aplicativos mobile para iOS e Android, e em 2014 passou a desenvolver também para Firefox OS. Para o desenvolvimento desses aplicativos, usou as seguintes linguagens e frameworks: Swift, Objective-C, HTML5, CSS3, JS e Apache Cordova. Também escreve artigos e faz palestras, além de ser voluntário do Mozzila, contribuindo para a comunidade.'),(5,'Marcelo Castellani','Marcelo Castellani é programador desde quando os computadores eram antissociais e não se comunicavam em rede. Passou grande parte de sua vida desenvolvendo software embarcado de alta performance para automação bancária com C e C++ em empresas como Itautec e OKI, mas também desenvolveu projetos complexos com Java e muito código Ruby. Hoje, é especialista em desenvolvimento de software na TOTVS, uma das maiores empresas de tecnologia do mundo. Interessou-se por Rust quando viu que algumas companhias estavam o utilizando em produção para desenvolver firmware, e desde então tem feito dela sua primeira opção quando é possível.'),(6,'Nelson Fabbri Gerbelli','Nelson Fabbri Gerbelli é Tecnólogo em Processamento de Dados pela faculdade FAINAM, pós-graduado em Análise de Sistemas pela faculdade ESAN. Pedagogo e possui licenciatura plena em Informática. É professor em cursos de TI no Centro Estadual de Educação Tecnológica Paula Souza do Estado de São Paulo nas ETECs, atuando principalmente nas seguintes disciplinas: Tecnologia para mobilidade, técnicas de programação para internet e desenvolvimento de softwares com o Visual Studio.Net.'),(7,'Valéria Helena P. Gerbelli','Valéria Helena P. Gerbelli é Tecnóloga em Processamento de Dados pela faculdade IESA. Pedagoga e com licenciatura plena em Informática. Pós-graduanda em Educação Profissional e Tecnológica. Professora de Tecnologia da Informação no Centro Estadual de Educação Tecnológica Paula Souza pelo Estado de São Paulo, nas ETECs, atuando principalmente nas seguintes disciplinas: Tecnologia para mobilidade, técnicas de programação para internet e Programação de Computadores.'),(8,'Paulo Siécola','Paulo César Siécola é Mestre em Ciência da Computação pelo Instituto de Matemática e Estatística da Universidade de São Paulo (2011). Possui graduação em Engenharia Elétrica pelo Instituto Nacional de Telecomunicações – INATEL (2005). Atualmente, é analista de desenvolvimento de sistemas sênior na WatchGuard e professor em cursos de Pós-Graduação no INATEL. Tem experiência em desenvolvimento de software em C, Java, Swift e C#, atuando principalmente nos seguintes temas: desenvolvimento Web, sistemas embarcados e desenvolvimento de aplicativos móveis para Android e iOS.'),(1008,'Leonardo Vilarinho','Leonardo Vilarinho é Analista de Sistemas pelo Instituto Federal do Triângulo Mineiro e desenvolvedor freelancer full-stack. Focado no desenvolvimento web com qualidade, vê que essa área já é o futuro da computação juntamente com a inteligência artificial. É editor do Vue.js Brasil e vive no GitHub entre uma contribuição e outra.'),(2008,'Marcos Brizeno','Marcos Brizeno é Cientista da Computação pela Universidade Estadual do Ceará e Consultor na ThoughtWorks Brasil. Apaixonado por Engenharia de Software, em especial Metodologias Ágeis, gosta dos desafios de desenvolver software e se apaixonou à primeira vista por Ruby. Publica regularmente em brizeno.wordpress.com, e gosta de jogar videogames para passar o tempo e ter novas ideias.');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartaocredito`
--

DROP TABLE IF EXISTS `cartaocredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cartaocredito` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTitular` longtext NOT NULL,
  `Numero` longtext NOT NULL,
  `Validade` datetime(6) NOT NULL,
  `Bandeira` int(11) NOT NULL,
  `Codigo` longtext NOT NULL,
  `Ativo` bit(1) NOT NULL,
  `ClienteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_CartaoCredito_ClienteId` (`ClienteId`),
  CONSTRAINT `FK_CartaoCredito_Cliente_ClienteId` FOREIGN KEY (`ClienteId`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartaocredito`
--

LOCK TABLES `cartaocredito` WRITE;
/*!40000 ALTER TABLE `cartaocredito` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartaocredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categoria` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Ativa` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Categoria_Nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Programação',_binary ''),(2,'Mobile',_binary ''),(3,'Front-end',_binary ''),(4,'Infraestrutura',_binary ''),(5,'Business',_binary ''),(6,'Design & UX',_binary '');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` longtext NOT NULL,
  `Cpf` longtext NOT NULL,
  `DataNascimento` datetime(6) NOT NULL,
  `EnderecoPrincipalId` int(11) NOT NULL,
  `DataCadastro` datetime(6) NOT NULL,
  `Ativo` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Cliente_EnderecoPrincipalId` (`EnderecoPrincipalId`),
  CONSTRAINT `FK_Cliente_Endereco_EnderecoPrincipalId` FOREIGN KEY (`EnderecoPrincipalId`) REFERENCES `endereco` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimensoes`
--

DROP TABLE IF EXISTS `dimensoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dimensoes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Altura` decimal(18,2) NOT NULL,
  `Largura` decimal(18,2) NOT NULL,
  `Profundidade` decimal(18,2) NOT NULL,
  `Peso` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimensoes`
--

LOCK TABLES `dimensoes` WRITE;
/*!40000 ALTER TABLE `dimensoes` DISABLE KEYS */;
INSERT INTO `dimensoes` VALUES (1,25.00,20.00,5.00,80.00),(2,25.00,20.00,5.00,80.00),(3,25.00,20.00,5.00,80.00),(4,25.00,20.00,5.00,80.00),(5,25.00,20.00,5.00,80.00),(6,25.00,20.00,5.00,80.00),(7,25.00,20.00,5.00,80.00),(8,25.00,20.00,5.00,80.00),(9,25.00,20.00,5.00,100.00),(10,30.00,15.00,10.00,130.00);
/*!40000 ALTER TABLE `dimensoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `endereco` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cep` longtext NOT NULL,
  `Logradouro` longtext NOT NULL,
  `Numero` int(11) NOT NULL,
  `Complemento` longtext,
  `Bairro` longtext NOT NULL,
  `Cidade` longtext NOT NULL,
  `Estado` longtext NOT NULL,
  `Ativo` bit(1) NOT NULL,
  `ClienteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Endereco_ClienteId` (`ClienteId`),
  CONSTRAINT `FK_Endereco_Cliente_ClienteId` FOREIGN KEY (`ClienteId`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frete`
--

DROP TABLE IF EXISTS `frete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `frete` (
  `Valor` decimal(18,2) NOT NULL,
  `PrazoEntrega` int(11) NOT NULL,
  `PedidoId` int(11) NOT NULL,
  PRIMARY KEY (`PedidoId`),
  CONSTRAINT `FK_Frete_Pedido_PedidoId` FOREIGN KEY (`PedidoId`) REFERENCES `pedido` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frete`
--

LOCK TABLES `frete` WRITE;
/*!40000 ALTER TABLE `frete` DISABLE KEYS */;
/*!40000 ALTER TABLE `frete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagem`
--

DROP TABLE IF EXISTS `imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `imagem` (
  `CaminhoReal` longtext NOT NULL,
  `CaminhoAcesso` longtext NOT NULL,
  `Extensao` longtext NOT NULL,
  `DataCadastro` datetime(6) NOT NULL,
  `LivroId` int(11) NOT NULL,
  PRIMARY KEY (`LivroId`),
  CONSTRAINT `FK_Imagem_Livro_LivroId` FOREIGN KEY (`LivroId`) REFERENCES `livro` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagem`
--

LOCK TABLES `imagem` WRITE;
/*!40000 ALTER TABLE `imagem` DISABLE KEYS */;
INSERT INTO `imagem` VALUES ('C:Users	allesaragaosource\reposCasaDoCodigoCasadocodigowwwrootimagesprodutosf3a118ee-01b0-40d7-82f1-2364ea7c5f29.jpg','~/images/produtos/f3a118ee-01b0-40d7-82f1-2364ea7c5f29.jpg','.jpg','2018-10-04 12:08:56.000000',1),('C:Users	allesaragaosource\reposCasaDoCodigoCasadocodigowwwrootimagesprodutos3e5f1d2b-108e-49f7-a5ba-30f339ea55a3.jpg','~/images/produtos/3e5f1d2b-108e-49f7-a5ba-30f339ea55a3.jpg','.jpg','2018-10-04 12:14:45.000000',2),('C:Users	allesaragaosource\reposCasaDoCodigoCasadocodigowwwrootimagesprodutos9a52a86-a684-4a0f-be83-1e644104cedf.jpg','~/images/produtos/b9a52a86-a684-4a0f-be83-1e644104cedf.jpg','.jpg','2018-10-04 12:25:23.000000',3),('C:Users	allesaragaosource\reposCasaDoCodigoCasadocodigowwwrootimagesprodutos22f7155b-5444-495d-9c4a-8d26c24c5941.jpg','~/images/produtos/22f7155b-5444-495d-9c4a-8d26c24c5941.jpg','.jpg','2018-10-04 12:33:53.000000',4),('C:Users	allesaragaosource\reposCasaDoCodigoCasadocodigowwwrootimagesprodutos2d31d581-400d-4e23-8d43-8e60a2cf9136.jpg','~/images/produtos/2d31d581-400d-4e23-8d43-8e60a2cf9136.jpg','.jpg','2018-10-04 12:38:29.000000',5),('C:Users	allesaragaosource\reposCasadocodigoCasadocodigowwwrootimagesprodutos21f6d41d-3071-4678-aa89-3cbe47dfb8c1.jpg','~/images/produtos/21f6d41d-3071-4678-aa89-3cbe47dfb8c1.jpg','.jpg','2018-10-05 11:23:53.000000',6),('C:Users	allesaragaosource\reposCasadocodigoCasadocodigowwwrootimagesprodutosab43d2c7-10ac-4714-bbd5-04601b4a41d9.jpg','~/images/produtos/ab43d2c7-10ac-4714-bbd5-04601b4a41d9.jpg','.jpg','2018-10-05 11:37:11.000000',1006),('C:Users	allesaragaosource\reposCasaDoCodigoCasadocodigowwwrootimagesprodutosa3be94a5-2053-43ed-a8e7-e9bec9021f4a.jpg','~/images/produtos/a3be94a5-2053-43ed-a8e7-e9bec9021f4a.jpg','.jpg','2018-10-09 12:41:26.000000',2006);
/*!40000 ALTER TABLE `imagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itempedido`
--

DROP TABLE IF EXISTS `itempedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `itempedido` (
  `LivroId` int(11) NOT NULL,
  `PedidoId` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Subtotal` decimal(18,2) NOT NULL,
  PRIMARY KEY (`PedidoId`,`LivroId`),
  KEY `IX_ItemPedido_LivroId` (`LivroId`),
  CONSTRAINT `FK_ItemPedido_Livro_LivroId` FOREIGN KEY (`LivroId`) REFERENCES `livro` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ItemPedido_Pedido_PedidoId` FOREIGN KEY (`PedidoId`) REFERENCES `pedido` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itempedido`
--

LOCK TABLES `itempedido` WRITE;
/*!40000 ALTER TABLE `itempedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `itempedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `livro` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) NOT NULL,
  `Subtitulo` longtext,
  `Isbn` varchar(255) NOT NULL,
  `DimensoesId` int(11) NOT NULL,
  `Paginas` int(11) NOT NULL,
  `Descricao` longtext NOT NULL,
  `DataCadastro` datetime(6) NOT NULL,
  `Ativo` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Livro_DimensoesId` (`DimensoesId`),
  UNIQUE KEY `IX_Livro_Isbn` (`Isbn`),
  UNIQUE KEY `IX_Livro_Titulo` (`Titulo`),
  CONSTRAINT `FK_Livro_Dimensoes_DimensoesId` FOREIGN KEY (`DimensoesId`) REFERENCES `dimensoes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2007 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'ASP.NET Core MVC','ASP.NET Core MVC','978-85-94188-45-8',10,249,'O ASP.NET Core MVC é um novo framework de código aberto da Microsoft para o desenvolvimento de aplicações web. Ele está dentro do framework .NET Core, o que possibilita a construção e a execução de aplicações em Windows, Mac e Linux. Utilizando como ferramentas o Visual Studio e a linguagem C# para os exemplos, o livro traz implementações que subsidiarão o desenvolvimento de suas próprias aplicações. Os exemplos também introduzem o Bootstrap e trabalham em uma ligação estreita com o Entity Framework Core como ferramenta para persistência de dados.\n\nNeste livro, Everton Coimbra apresenta o ASP.NET Core MVC de uma maneira que o leitor já possa aprender com a prática desde o início. O estudo é dirigido ao desenvolvimento de uma aplicação que envolve persistência em uma base de dados, fazendo uso do Entity Framework Core. Você verá desde as operações CRUD até como desenvolver seus layouts e tabelas, separando sua aplicação em camadas seguindo os conceitos de coesão e acoplamento. Dentre as técnicas e recursos apresentados, estão associações, personalização das classes de modelo, controle de acesso de usuários, tratamento de erros, controles DropDownList aninhados e o uso de sessão para o armazenamento de dados.','2018-10-04 12:08:36.000000',_binary ''),(2,'Construct 2','Construct 2','978-85-94188-39-7',9,227,'O mercado de jogos no Brasil e o número de pessoas interessadas em ingressar nele não param de crescer. Porém, a maioria das plataformas para produção de jogos exige tanto background tecnológico que acaba desanimando qualquer um. Felizmente, o Construct 2 surgiu pensando no usuário que deseja desenvolver suas próprias ideias, sem a necessidade de possuir algum conhecimento técnico prévio.\n\nNeste livro, Diego e Bruna provam que qualquer um é capaz de construir seus próprios jogos e exportá-los nos mais diversos formatos. Você verá como funcionam todos os mecanismos para criar um jogo de plataforma completo, com todas as telas, sistema de inimigos e movimentação dos personagens, que funcionará tanto em navegadores como em celulares!','2018-10-04 12:14:45.000000',_binary ''),(3,'Marketing de Conteúdo','Marketing de Conteúdo','978-85-94188-36-6',3,213,'Em um mundo no qual tudo é informação, saber entregá-la no melhor formato ao seu público é uma das chaves do sucesso para uma estratégia de marketing de conteúdo. Através dele, as marcas podem, além de conhecer melhor o seu público, entregar exatamente o que ele quer consumir, tanto no que diz respeito ao conteúdo como ao produto.\n\nNeste livro, Jonathan Lamim compartilha seus conhecimentos sobre marketing de conteúdo para que você possa realizar um trabalho de qualidade e que gere resultados, seja como um consultor freelancer, atuando dentro de alguma empresa de marketing, ou no setor de marketing de empresas de outros ramos. Você verá como desenvolver técnicas como estudos de personas e fatores de ranqueamento de SEO, junto das melhores estratégias para criar conteúdo de valor e medir os resultados de seu plano de marketing.','2018-10-04 12:25:23.000000',_binary ''),(4,'Rust','Concorrência e alta performance com segurança','978-85-94188-33-5',4,237,'Quando falamos em linguagens de programação voltadas à construção de sistemas que exigem performance e agilidade, Rust tem ganhado muita notoriedade. Ela foi feita para ser segura a ponto de possibilitar uma concorrência limpa sem a famigerada race condition. Trata-se de uma linguagem open source multiparadigma, sendo uma ótima alternativa ao C++.\n\nNeste livro, Marcelo Castellani mostra por que Rust encaixa-se perfeitamente neste momento de busca por tecnologias capazes de efetuar processamento rápido e paralelo, para o desenvolvimento de ferramentas que exigem performance, como sistemas embarcados e aplicativos de servidor. Você vai aprender na prática conceitos como traits, vetores, generics, macros, entre outros, chegando aos testes e à compilação final do código. Com Rust, você será capaz de escrever sistemas complexos, de alta performance, robustos e seguros.','2018-10-04 12:33:53.000000',_binary ''),(5,'App Inventor','Seus primeiros aplicativos Android','978-85-94188-30-4',5,313,'O App Inventor 2 é uma ferramenta inovadora, desenvolvida pelo Google e mantida hoje pelo Instituto de Tecnologia de Massachusetts (MIT). Com ela, é possível criar aplicativos para dispositivos móveis Android, por meio de uma linguagem visual, sem precisar decorar ou escrever códigos de linguagem de programação. Com um simples arrastar e inserir blocos para a área de programação, em uma interface intuitiva, é uma excelente ferramenta de aprendizado que permite que os recém-chegados à programação de computador criem aplicativos completos.\n\nNeste livro, Nelson e Valéria Gerbelli têm como objetivo proporcionar aos estudantes, educadores e entusiastas por tecnologia o primeiro passo no mundo da programação para dispositivos móveis por meio do App Inventor. Após ser apresentado ao ambiente, você aprenderá na prática a desenvolver alguns aplicativos do zero, partindo de alguns cálculos, até chegar a resultados mais complexos, com um recurso de localização de GPS, tradução de idioma e desenvolvendo um projeto final completo. Dentre as funcionalidades, estão o compartilhamento com outros aplicativos como o WhatsApp, a conexão a um banco de dados em MySQL, e a disponibilização do aplicativo na loja do Google Play Store.','2018-10-04 12:38:29.000000',_binary ''),(6,'Google App Engine','Construindo serviços na nuvem','978-85-5519-159-6',6,256,'O Google App Engine é uma plataforma de computação em nuvem que permite a execução de aplicações Web na infraestrutura do Google. Tudo isso de forma fácil e escalável, com várias opções de utilização gratuitas e sem a necessidade de manutenção em sistemas operacionais ou servidores.\n\nNesta edição atualizada, Paulo Siécola aborda os aspectos dessa plataforma utilizando Spring Boot - principalmente aqueles relacionados ao desenvolvimento de aplicações em Java. Você verá como interagir com seus recursos, além de como administrá-los por meio das ferramentas disponibilizadas pelo Google App Engine, ou GAE, como é comumente chamado.\n\nVersões utilizadas: Java 8, Google App Engine Standard Environment com SDK 1.9 e Spring Boot versão 1.5.9.','2018-10-05 11:23:53.000000',_binary ''),(1006,'Front-end com Vue.js','Da teoria à prática sem complicações','978-85-94188-27-4',7,215,'Se você acha que é preciso muito tempo e códigos HTML, CSS e JavaScript embolados para conseguir construir um layout moderno e interativo, com um curto tempo de carregamento e funcionamento em qualquer plataforma, com certeza não conhece o Vue.js. Ele é um framework feito em JavaScript, que tem como principal objetivo o reaproveitamento de código e uma curva de aprendizagem pequena.\n\nNeste livro, Leonardo Vilarinho traz um guia de consulta com exercícios práticos ao final de cada capítulo. Você verá uma documentação mais compacta do Vue.js, para conhecer esse framework sem complicações. Você aprenderá a inserir, exibir e manipular dados, usar e reutilizar componentes, criar rotas, diretivas e plugins personalizados, gerenciar estados, e fazer testes automatizados. Ao final, você vai construir uma aplicação usando o que foi visto, uma API feita com o Laravel e o runner de testes AVA.','2018-10-05 11:37:11.000000',_binary ''),(2006,'Refatorando com padrões de projeto','Um guia em Java','978-85-94188-21-2',8,142,'Qualidade de código e refatoração são reconhecidamente assuntos que permanecem relevantes e pertinentes tanto para novos profissionais como para quem já sabe do que se trata: melhorar o design existente, aplicar mudanças em pequenos passos e evitar deixar o sistema quebrado. Ao aplicar refatorações, existem várias técnicas que podem ajudar a alcançar a melhoria desejada, de modo que o processo seja feito de maneira responsável e garantindo o funcionamento da aplicação por meio de testes unitários.\n\nNeste livro, Marcos Brizeno mostra como padrões de projeto podem servir como guias para a refatoração projetos Java, para que você saiba decidir quando ou não determinado padrão pode ser aplicado para alcançar o código ideal. Por meio de exemplos práticos, você terá um melhor entendimento sobre design orientado a objetos, permitindo identificar mais facilmente os problemas e implementar soluções flexíveis e fáceis de evoluir.','2018-10-09 12:41:24.000000',_binary '');
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livroautor`
--

DROP TABLE IF EXISTS `livroautor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `livroautor` (
  `LivroId` int(11) NOT NULL,
  `AutorId` int(11) NOT NULL,
  PRIMARY KEY (`LivroId`,`AutorId`),
  KEY `IX_LivroAutor_AutorId` (`AutorId`),
  CONSTRAINT `FK_LivroAutor_Autor_AutorId` FOREIGN KEY (`AutorId`) REFERENCES `autor` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_LivroAutor_Livro_LivroId` FOREIGN KEY (`LivroId`) REFERENCES `livro` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livroautor`
--

LOCK TABLES `livroautor` WRITE;
/*!40000 ALTER TABLE `livroautor` DISABLE KEYS */;
INSERT INTO `livroautor` VALUES (1,1),(2,2),(2,3),(3,4),(4,5),(5,6),(5,7),(6,8),(1006,1008),(2006,2008);
/*!40000 ALTER TABLE `livroautor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livrocategoria`
--

DROP TABLE IF EXISTS `livrocategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `livrocategoria` (
  `LivroId` int(11) NOT NULL,
  `CategoriaId` int(11) NOT NULL,
  PRIMARY KEY (`LivroId`,`CategoriaId`),
  KEY `IX_LivroCategoria_CategoriaId` (`CategoriaId`),
  CONSTRAINT `FK_LivroCategoria_Categoria_CategoriaId` FOREIGN KEY (`CategoriaId`) REFERENCES `categoria` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_LivroCategoria_Livro_LivroId` FOREIGN KEY (`LivroId`) REFERENCES `livro` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livrocategoria`
--

LOCK TABLES `livrocategoria` WRITE;
/*!40000 ALTER TABLE `livrocategoria` DISABLE KEYS */;
INSERT INTO `livrocategoria` VALUES (1,1),(2,1),(4,1),(5,1),(2006,1),(5,2),(1,3),(1006,3),(6,4),(3,5);
/*!40000 ALTER TABLE `livrocategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` longtext,
  `ClienteId` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `DataRealizacao` datetime(6) NOT NULL,
  `Subtotal` decimal(18,2) NOT NULL,
  `Total` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Pedido_ClienteId` (`ClienteId`),
  CONSTRAINT `FK_Pedido_Cliente_ClienteId` FOREIGN KEY (`ClienteId`) REFERENCES `cliente` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precificacao`
--

DROP TABLE IF EXISTS `precificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `precificacao` (
  `PrecoUnitario` decimal(18,2) NOT NULL,
  `LivroId` int(11) NOT NULL,
  PRIMARY KEY (`LivroId`),
  CONSTRAINT `FK_Precificacao_Livro_LivroId` FOREIGN KEY (`LivroId`) REFERENCES `livro` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precificacao`
--

LOCK TABLES `precificacao` WRITE;
/*!40000 ALTER TABLE `precificacao` DISABLE KEYS */;
INSERT INTO `precificacao` VALUES (39.90,1),(49.90,2),(29.90,3),(29.90,4),(29.90,5),(24.90,6),(29.90,1006),(29.90,2006);
/*!40000 ALTER TABLE `precificacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-19 11:43:35
