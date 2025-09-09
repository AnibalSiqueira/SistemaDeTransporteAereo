-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.2.0 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para sistemadetransporteaereo
DROP DATABASE IF EXISTS `sistemadetransporteaereo`;
CREATE DATABASE IF NOT EXISTS `sistemadetransporteaereo` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistemadetransporteaereo`;

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_aeroportos
DROP TABLE IF EXISTS `tb_aeroportos`;
CREATE TABLE IF NOT EXISTS `tb_aeroportos` (
  `id_aeroporto` int NOT NULL AUTO_INCREMENT,
  `codigo_iata` char(3) COLLATE utf8mb3_bin NOT NULL,
  `codigo_icao` char(4) COLLATE utf8mb3_bin NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `elevacao_metros` int NOT NULL,
  `tamanhoPista` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `status` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id_aeroporto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_aeroportos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_avioes
DROP TABLE IF EXISTS `tb_avioes`;
CREATE TABLE IF NOT EXISTS `tb_avioes` (
  `id_aviao` int NOT NULL AUTO_INCREMENT,
  `fabricante` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `modelo` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `anoFabricacao` date NOT NULL,
  `capacidadePassageiro` int DEFAULT NULL,
  `capacidadeCarga` double NOT NULL,
  `tb_montadoras_id` int NOT NULL,
  `tb_companhiaAerea_id` int NOT NULL,
  PRIMARY KEY (`id_aviao`,`tb_montadoras_id`,`tb_companhiaAerea_id`),
  KEY `fk_tb_avioes_tb_montadoras_idx` (`tb_montadoras_id`),
  KEY `fk_tb_avioes_tb_companhiaAerea1_idx` (`tb_companhiaAerea_id`),
  CONSTRAINT `fk_tb_avioes_tb_companhiaAerea1` FOREIGN KEY (`tb_companhiaAerea_id`) REFERENCES `tb_companhiaaerea` (`id_companhiaAerea`),
  CONSTRAINT `fk_tb_avioes_tb_montadoras` FOREIGN KEY (`tb_montadoras_id`) REFERENCES `tb_fabricante` (`id_fabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_avioes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_checkin
DROP TABLE IF EXISTS `tb_checkin`;
CREATE TABLE IF NOT EXISTS `tb_checkin` (
  `id_checkIn` int NOT NULL AUTO_INCREMENT,
  `data_checkIn` date NOT NULL,
  `hora_checkIn` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `status` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `observacoes` varchar(500) COLLATE utf8mb3_bin DEFAULT NULL,
  `portaoEmbarque` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `tb_passagem_id` int NOT NULL,
  PRIMARY KEY (`id_checkIn`,`tb_passagem_id`),
  KEY `fk_tb_checkIn_tb_passagem1_idx` (`tb_passagem_id`),
  CONSTRAINT `fk_tb_checkIn_tb_passagem1` FOREIGN KEY (`tb_passagem_id`) REFERENCES `tb_passagem` (`id_passagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_checkin: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_companhiaaerea
DROP TABLE IF EXISTS `tb_companhiaaerea`;
CREATE TABLE IF NOT EXISTS `tb_companhiaaerea` (
  `id_companhiaAerea` int NOT NULL AUTO_INCREMENT,
  `nomeCompanhia` varchar(200) COLLATE utf8mb3_bin NOT NULL,
  `cnpj` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `emailOficial` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `status` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id_companhiaAerea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_companhiaaerea: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_fabricante
DROP TABLE IF EXISTS `tb_fabricante`;
CREATE TABLE IF NOT EXISTS `tb_fabricante` (
  `id_fabricante` int NOT NULL,
  `nomeMontadora` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `paisOrigem` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `sede` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id_fabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_fabricante: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_funcionarios
DROP TABLE IF EXISTS `tb_funcionarios`;
CREATE TABLE IF NOT EXISTS `tb_funcionarios` (
  `id_funcionarios` int NOT NULL AUTO_INCREMENT,
  `nomeFuncionario` varchar(300) COLLATE utf8mb3_bin NOT NULL,
  `cpfFuncionario` varchar(30) COLLATE utf8mb3_bin NOT NULL,
  `cargoFuncionario` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `emailFuncionario` varchar(150) COLLATE utf8mb3_bin NOT NULL,
  `telefoneFuncionario` varchar(150) COLLATE utf8mb3_bin NOT NULL,
  `statusFuncionario` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `salarioFuncionario` double NOT NULL,
  `tb_companhiaAerea_id` int NOT NULL,
  PRIMARY KEY (`id_funcionarios`,`tb_companhiaAerea_id`),
  KEY `fk_tb_funcionarios_tb_companhiaAerea1_idx` (`tb_companhiaAerea_id`),
  CONSTRAINT `fk_tb_funcionarios_tb_companhiaAerea1` FOREIGN KEY (`tb_companhiaAerea_id`) REFERENCES `tb_companhiaaerea` (`id_companhiaAerea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_funcionarios: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_manutencao
DROP TABLE IF EXISTS `tb_manutencao`;
CREATE TABLE IF NOT EXISTS `tb_manutencao` (
  `id_manutencao` int NOT NULL AUTO_INCREMENT,
  `tipoManutencao` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `descricao` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `data_inicio` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `data_fim` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `custo` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `status` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `tb_avioes_id` int NOT NULL,
  PRIMARY KEY (`id_manutencao`,`tb_avioes_id`),
  KEY `fk_tb_manutencao_tb_avioes1_idx` (`tb_avioes_id`),
  CONSTRAINT `fk_tb_manutencao_tb_avioes1` FOREIGN KEY (`tb_avioes_id`) REFERENCES `tb_avioes` (`id_aviao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_manutencao: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_pagamento
DROP TABLE IF EXISTS `tb_pagamento`;
CREATE TABLE IF NOT EXISTS `tb_pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `pagamentoFeito` tinyint NOT NULL,
  `metodoPagamento` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `quantParcelas` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `validadePagamento` date NOT NULL,
  `observacao` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_pagamento: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_passageiro
DROP TABLE IF EXISTS `tb_passageiro`;
CREATE TABLE IF NOT EXISTS `tb_passageiro` (
  `id_passageiro` int NOT NULL AUTO_INCREMENT,
  `nomePassageiro` varchar(300) COLLATE utf8mb3_bin NOT NULL,
  `emailPassageiro` varchar(150) COLLATE utf8mb3_bin NOT NULL,
  `telefonePassageiro` varchar(150) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id_passageiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_passageiro: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_passageirosporvoo
DROP TABLE IF EXISTS `tb_passageirosporvoo`;
CREATE TABLE IF NOT EXISTS `tb_passageirosporvoo` (
  `id_passageirosPorVoo` int NOT NULL AUTO_INCREMENT,
  `tb_passageiro_id` int NOT NULL,
  `tb_voos_id` int NOT NULL,
  PRIMARY KEY (`id_passageirosPorVoo`,`tb_passageiro_id`,`tb_voos_id`),
  KEY `fk_tb_passageiro_has_tb_voos_tb_voos1_idx` (`tb_voos_id`),
  KEY `fk_tb_passageiro_has_tb_voos_tb_passageiro1_idx` (`tb_passageiro_id`),
  CONSTRAINT `fk_tb_passageiro_has_tb_voos_tb_passageiro1` FOREIGN KEY (`tb_passageiro_id`) REFERENCES `tb_passageiro` (`id_passageiro`),
  CONSTRAINT `fk_tb_passageiro_has_tb_voos_tb_voos1` FOREIGN KEY (`tb_voos_id`) REFERENCES `tb_voos` (`id_voo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_passageirosporvoo: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_passagem
DROP TABLE IF EXISTS `tb_passagem`;
CREATE TABLE IF NOT EXISTS `tb_passagem` (
  `id_passagem` int NOT NULL AUTO_INCREMENT,
  `numeroPassgem` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `classePassagem` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `dataDeVoo` date NOT NULL,
  `destinoPassagem` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `precoPassagem` double NOT NULL,
  `assentoPassagem` varchar(10) COLLATE utf8mb3_bin NOT NULL,
  `tb_voos_id` int NOT NULL,
  `tb_passageiro_id` int NOT NULL,
  `tb_pagamento_id` int NOT NULL,
  PRIMARY KEY (`id_passagem`,`tb_voos_id`,`tb_passageiro_id`,`tb_pagamento_id`),
  KEY `fk_tb_passagem_tb_voos1_idx` (`tb_voos_id`),
  KEY `fk_tb_passagem_tb_passageiro1_idx` (`tb_passageiro_id`),
  KEY `fk_tb_passagem_tb_pagamento1_idx` (`tb_pagamento_id`),
  CONSTRAINT `fk_tb_passagem_tb_pagamento1` FOREIGN KEY (`tb_pagamento_id`) REFERENCES `tb_pagamento` (`id_pagamento`),
  CONSTRAINT `fk_tb_passagem_tb_passageiro1` FOREIGN KEY (`tb_passageiro_id`) REFERENCES `tb_passageiro` (`id_passageiro`),
  CONSTRAINT `fk_tb_passagem_tb_voos1` FOREIGN KEY (`tb_voos_id`) REFERENCES `tb_voos` (`id_voo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_passagem: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_tripulacao
DROP TABLE IF EXISTS `tb_tripulacao`;
CREATE TABLE IF NOT EXISTS `tb_tripulacao` (
  `id_tripulacao` int NOT NULL AUTO_INCREMENT,
  `tipoTripulante` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `licenca` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `validade_licenca` date DEFAULT NULL,
  `horas_voadas` double DEFAULT NULL,
  `certificacoes` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id_tripulacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_tripulacao: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_tripulacaoporvoo
DROP TABLE IF EXISTS `tb_tripulacaoporvoo`;
CREATE TABLE IF NOT EXISTS `tb_tripulacaoporvoo` (
  `id_tripulacaoPorVoo` int NOT NULL AUTO_INCREMENT,
  `tb_tripulacao_id` int NOT NULL,
  `tb_voos_id` int NOT NULL,
  PRIMARY KEY (`id_tripulacaoPorVoo`,`tb_tripulacao_id`,`tb_voos_id`),
  KEY `fk_tb_tripulacao_has_tb_voos_tb_voos1_idx` (`tb_voos_id`),
  KEY `fk_tb_tripulacao_has_tb_voos_tb_tripulacao1_idx` (`tb_tripulacao_id`),
  CONSTRAINT `fk_tb_tripulacao_has_tb_voos_tb_tripulacao1` FOREIGN KEY (`tb_tripulacao_id`) REFERENCES `tb_tripulacao` (`id_tripulacao`),
  CONSTRAINT `fk_tb_tripulacao_has_tb_voos_tb_voos1` FOREIGN KEY (`tb_voos_id`) REFERENCES `tb_voos` (`id_voo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_tripulacaoporvoo: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_voos
DROP TABLE IF EXISTS `tb_voos`;
CREATE TABLE IF NOT EXISTS `tb_voos` (
  `id_voo` int NOT NULL AUTO_INCREMENT,
  `numVoo` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `statusVoo` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `tb_avioes_id` int NOT NULL,
  `tb_aeroportos_id` int NOT NULL,
  PRIMARY KEY (`id_voo`,`tb_avioes_id`,`tb_aeroportos_id`),
  KEY `fk_tb_voos_tb_avioes1_idx` (`tb_avioes_id`),
  KEY `fk_tb_voos_tb_aeroportos1_idx` (`tb_aeroportos_id`),
  CONSTRAINT `fk_tb_voos_tb_aeroportos1` FOREIGN KEY (`tb_aeroportos_id`) REFERENCES `tb_aeroportos` (`id_aeroporto`),
  CONSTRAINT `fk_tb_voos_tb_avioes1` FOREIGN KEY (`tb_avioes_id`) REFERENCES `tb_avioes` (`id_aviao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_voos: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
