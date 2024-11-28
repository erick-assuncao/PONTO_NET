drop database nerd_store;
create database nerd_store;
use nerd_store;

-- nerd_store.AspNetRoles definition

CREATE TABLE `AspNetRoles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nerd_store.AspNetUsers definition

CREATE TABLE `AspNetUsers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nerd_store.Categorias definition

CREATE TABLE `Categorias` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Nome` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Codigo` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Categorias` (`Id`, `Nome`, `Codigo`)
VALUES 
(UUID(), 'Alimentos não perecíveis', 1001),
(UUID(), 'Alimentos perecíveis', 1002),
(UUID(), 'Bebidas', 1003),
(UUID(), 'Limpeza Doméstica', 1004),
(UUID(), 'Higiene Pessoal', 1005),
(UUID(), 'Padaria', 1006),
(UUID(), 'Açougue', 1007),
(UUID(), 'Congelados', 1008),
(UUID(), 'Laticínios', 1009),
(UUID(), 'Frutas, Verduras e Legumes', 1010),
(UUID(), 'Mercearia', 1011),
(UUID(), 'Utilidades Domésticas', 1012);



-- nerd_store.Pagamentos definition

CREATE TABLE `Pagamentos` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `PedidoId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Valor` decimal(65,30) NOT NULL,
  `NomeCartao` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NumeroCartao` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ExpiracaoCartao` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CvvCartao` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nerd_store.Vouchers definition

CREATE TABLE `Vouchers` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Codigo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Percentual` decimal(65,30) DEFAULT NULL,
  `ValorDesconto` decimal(65,30) DEFAULT NULL,
  `Quantidade` int NOT NULL,
  `TipoDescontoVoucher` int NOT NULL,
  `DataCriacao` datetime(6) NOT NULL,
  `DataUtilizacao` datetime(6) DEFAULT NULL,
  `DataValidade` datetime(6) NOT NULL,
  `Ativo` tinyint(1) NOT NULL,
  `Utilizado` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nerd_store.`__EFMigrationsHistory` definition

CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nerd_store.AspNetRoleClaims definition

CREATE TABLE `AspNetRoleClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nerd_store.AspNetUserClaims definition

CREATE TABLE `AspNetUserClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `AspNetUserClaims` (
  `Id`,
  `UserId`,
  `ClaimType`,
  `ClaimValue`
) VALUES (
  0,
  '308fe5f2-d48e-488c-a72e-a9cb4f473ab9',             -- UserId: o Id do usuário ao qual a claim será associada
  'Admin',    -- ClaimType: o tipo de claim, como 'permission'
  'Admin'      -- ClaimValue: o valor da claim, indicando a permissão
);

 SELECT * FROM `AspNetUserClaims`;
 SELECT * FROM `AspNetUsers`;



-- nerd_store.AspNetUserLogins definition

CREATE TABLE `AspNetUserLogins` (
  `LoginProvider` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nerd_store.AspNetUserRoles definition

CREATE TABLE `AspNetUserRoles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nerd_store.AspNetUserTokens definition

CREATE TABLE `AspNetUserTokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nerd_store.Pedidos definition

CREATE TABLE `Pedidos` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Codigo` int NOT NULL,
  `ClienteId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `VoucherId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `VoucherUtilizado` tinyint(1) NOT NULL,
  `Desconto` decimal(65,30) NOT NULL,
  `ValorTotal` decimal(65,30) NOT NULL,
  `DataCadastro` datetime(6) NOT NULL,
  `PedidoStatus` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Pedidos_VoucherId` (`VoucherId`),
  CONSTRAINT `FK_Pedidos_Vouchers_VoucherId` FOREIGN KEY (`VoucherId`) REFERENCES `Vouchers` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT PedidoStatus FROM Pedidos;
SELECT PedidoStatus FROM Pedidos WHERE Id = '42235efa-15f1-4159-bbdb-9baa2bcf7731';
SELECT Id FROM Pedidos;





-- nerd_store.Produtos definition

CREATE TABLE `Produtos` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `CategoriaId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Nome` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Descricao` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Ativo` tinyint(1) NOT NULL,
  `Valor` decimal(65,30) NOT NULL,
  `DataCadastro` datetime(6) NOT NULL,
  `Imagem` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `QuantidadeEstoque` int NOT NULL,
  `Altura` int NOT NULL,
  `Largura` int NOT NULL,
  `Profundidade` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Produtos_CategoriaId` (`CategoriaId`),
  CONSTRAINT `FK_Produtos_Categorias_CategoriaId` FOREIGN KEY (`CategoriaId`) REFERENCES `Categorias` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- nerd_store.Transacoes definition

CREATE TABLE `Transacoes` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `PedidoId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `PagamentoId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Total` decimal(65,30) NOT NULL,
  `StatusTransacao` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Transacoes_PagamentoId` (`PagamentoId`),
  CONSTRAINT `FK_Transacoes_Pagamentos_PagamentoId` FOREIGN KEY (`PagamentoId`) REFERENCES `Pagamentos` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nerd_store.PedidoItems definition

CREATE TABLE `PedidoItems` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `PedidoId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ProdutoId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ProdutoNome` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Quantidade` int NOT NULL,
  `ValorUnitario` decimal(65,30) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_PedidoItems_PedidoId` (`PedidoId`),
  CONSTRAINT `FK_PedidoItems_Pedidos_PedidoId` FOREIGN KEY (`PedidoId`) REFERENCES `Pedidos` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- SELECT `Id` FROM `Categorias` WHERE `Nome` = 'Alimentos não perecíveis';


/*INSERT INTO `Produtos` (`Id`, `CategoriaId`, `Nome`, `Descricao`, `Ativo`, `Valor`, `DataCadastro`, `Imagem`, `QuantidadeEstoque`, `Altura`, `Largura`, `Profundidade`)
VALUES (
  UUID(), 
  'a37e5360-89a4-11ef-9f8e-0a002700000c',  -- CategoriaId da categoria "Alimentos não perecíveis"
  'Arroz Camil 5KG', 
  'Arroz branco tipo 1', 
  1,  -- Ativo (1 = ativo)
  34.99,  -- Valor do produto
  NOW(),  -- DataCadastro
  'arroz-camil-5kg.jpg',  -- Caminho da imagem do produto
  100,  -- Quantidade em estoque
  30,  -- Altura em cm
  20,  -- Largura em cm
  15   -- Profundidade em cm
);

INSERT INTO `Produtos` (`Id`, `CategoriaId`, `Nome`, `Descricao`, `Ativo`, `Valor`, `DataCadastro`, `Imagem`, `QuantidadeEstoque`, `Altura`, `Largura`, `Profundidade`)
VALUES (
  UUID(), 
  'a37e5360-89a4-11ef-9f8e-0a002700000c',  -- CategoriaId da categoria "Alimentos não perecíveis"
  'Feijão Camil 1kg', 
  'Feijão Carioca tipo 1', 
  1,  -- Ativo (1 = ativo)
  8.90,  -- Valor do produto
  NOW(),  -- DataCadastro
  'feijao-camil.png',  -- Caminho da imagem do produto
  200,  -- Quantidade em estoque
  25,  -- Altura em cm
  15,  -- Largura em cm
  10   -- Profundidade em cm
);

INSERT INTO `Produtos` (`Id`, `CategoriaId`, `Nome`, `Descricao`, `Ativo`, `Valor`, `DataCadastro`, `Imagem`, `QuantidadeEstoque`, `Altura`, `Largura`, `Profundidade`)
VALUES (
  UUID(), 
  'a37e5360-89a4-11ef-9f8e-0a002700000c',  -- CategoriaId da categoria "Alimentos não perecíveis"
  'Feijão Kicaldo 1kg', 
  'Feijão carioca tipo 1', 
  1,  -- Ativo (1 = ativo)
  7.50,  -- Valor do produto
  NOW(),  -- DataCadastro
  'feijao-kicaldo.png',  -- Caminho da imagem do produto
  150,  -- Quantidade em estoque
  25,  -- Altura em cm
  15,  -- Largura em cm
  10   -- Profundidade em cm
);

INSERT INTO `Produtos` (`Id`, `CategoriaId`, `Nome`, `Descricao`, `Ativo`, `Valor`, `DataCadastro`, `Imagem`, `QuantidadeEstoque`, `Altura`, `Largura`, `Profundidade`)
VALUES (
  UUID(), 
  'a37e5360-89a4-11ef-9f8e-0a002700000c',  -- CategoriaId da categoria "Alimentos não perecíveis"
  'Arroz Tio João 5kg', 
  'Arroz branco tipo 1, embalagem de 5kg', 
  1,  -- Ativo (1 = ativo)
  34.99,  -- Valor do produto
  NOW(),  -- DataCadastro
  'arroz-tio-joao-5kg.png',  -- Caminho da imagem do produto
  120,  -- Quantidade em estoque
  45,  -- Altura em cm
  30,  -- Largura em cm
  15   -- Profundidade em cm
);

INSERT INTO `Produtos` (`Id`, `CategoriaId`, `Nome`, `Descricao`, `Ativo`, `Valor`, `DataCadastro`, `Imagem`, `QuantidadeEstoque`, `Altura`, `Largura`, `Profundidade`)
VALUES (
  UUID(), 
  'a37e5360-89a4-11ef-9f8e-0a002700000c',  -- CategoriaId da categoria "Alimentos não perecíveis"
  'Café Pelé 500g', 
  'Café torrado e moído, pacote de 500g', 
  1,  -- Ativo (1 = ativo)
  17.00,  -- Valor do produto
  NOW(),  -- DataCadastro
  'cafe-pele.jpg',  -- Caminho da imagem do produto
  180,  -- Quantidade em estoque
  25,  -- Altura em cm
  15,  -- Largura em cm
  10   -- Profundidade em cm
);

INSERT INTO `Produtos` (`Id`, `CategoriaId`, `Nome`, `Descricao`, `Ativo`, `Valor`, `DataCadastro`, `Imagem`, `QuantidadeEstoque`, `Altura`, `Largura`, `Profundidade`)
VALUES (
  UUID(), 
  'a37e5360-89a4-11ef-9f8e-0a002700000c',  -- CategoriaId da categoria "Alimentos não perecíveis"
  'Café Pilão 500g', 
  'Café torrado e moído, pacote de 500g', 
  1,  -- Ativo (1 = ativo)
  19.00,  -- Valor do produto
  NOW(),  -- DataCadastro
  'cafe-pilao.png',  -- Caminho da imagem do produto
  200,  -- Quantidade em estoque
  25,  -- Altura em cm
  15,  -- Largura em cm
  10   -- Profundidade em cm
);*/

/*SELECT `Id` FROM `Produtos`;
DELETE FROM `Produtos`
WHERE `Id` = 'd44fbe1d-8852-4892-a705-452ae95b83eb';*/

-- Remover colunas existentes
ALTER TABLE Pagamentos DROP COLUMN CvvCartao;
ALTER TABLE Pagamentos DROP COLUMN ExpiracaoCartao;
ALTER TABLE Pagamentos DROP COLUMN NomeCartao;
ALTER TABLE Pagamentos DROP COLUMN NumeroCartao;

-- Adicionar nova coluna


ALTER TABLE Pagamentos 
ADD COLUMN TipoPagamento VARCHAR(100) NOT NULL DEFAULT '';










