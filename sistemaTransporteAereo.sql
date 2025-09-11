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

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_alteraAeroporto
DROP PROCEDURE IF EXISTS `proc_alteraAeroporto`;
DELIMITER //
CREATE PROCEDURE `proc_alteraAeroporto`(
	IN `codAeroportoAlterar` INT,
	IN `codigoIATA_Alterar` CHAR(3),
	IN `codigoICAO_Alterar` CHAR(4),
	IN `latitudeAlterar` VARCHAR(50),
	IN `longitudeAlterar` VARCHAR(50),
	IN `elevacaoAlterar` INT,
	IN `tamanhoPistaAlterar` INT,
	IN `statusAlterar` VARCHAR(50)
)
BEGIN
	SELECT COUNT(*) INTO @exite FROM tb_aeroportos WHERE id_aeroporto = codAeroportoAlterar;
	
	if(@existe)
		then
			UPDATE tb_aeroportos SET
				codigo_iata = codigoIATA_Alterar,
				codigo_icao = codigoICAO_Alterar,
				latitude = latitudeAlterar,
				longitude = latitudeAlterar,
				elevacao_metros = elevacaoAlterar,
				tamanhoPista = tamanhoPistaAlterar,
				statos = statusAlterar
				WHERE id_aeroporto = codAeroportoAlterar;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Código inexistente";
	END if;
END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_alteraAvioes
DROP PROCEDURE IF EXISTS `proc_alteraAvioes`;
DELIMITER //
CREATE PROCEDURE `proc_alteraAvioes`(
	IN `codAviaoAlterar` INT,
	IN `fabricanteAlterar` VARCHAR(100),
	IN `modeloAlterar` VARCHAR(100),
	IN `anoFabricacaoAlterar` DATE,
	IN `capacidadePassageiroAlterar` INT,
	IN `capacidadeCargaAlterar` DOUBLE,
	IN `tb_manutencao_idAlterar` INT,
	IN `tb_companhiaAerea_idAlterar` INT
)
BEGIN
	SELECT COUNT(*) INTO @exite FROM tb_avioes WHERE id_aviao = codAviaoAlterar;
	
	if(@existe)
		then
			UPDATE tb_avioes set
				fabricante = fabricanteAlterar,
				modelo = modeloAlterar,
				anoFabricacao = anoFabricacaoAlterar,
				capacidadePassageiro = capacidadePassageiroAlterar,
				capacidadeCarga = capacidadeCargaAlterar,
				tb_manutencao_id = tb_manutencao_idAlterar,
				tb_companhiaAerea_id = tb_companhiaAerea_idAlterar
				WHERE id_aviao = codAviaoAlterar;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Código inexistente";
	END if;
END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_alteraCompanhiaAerea
DROP PROCEDURE IF EXISTS `proc_alteraCompanhiaAerea`;
DELIMITER //
CREATE PROCEDURE `proc_alteraCompanhiaAerea`(
	IN `codCompanhiaAlterar` INT,
	IN `nomeCompanhiaAlterar` VARCHAR(200),
	IN `cnpjAlterar` VARCHAR(50),
	IN `emailOficialAlterar` VARCHAR(50),
	IN `statusAlterar` VARCHAR(50)
)
BEGIN
	
	SELECT COUNT(*) INTO @exite FROM tb_companhiaaerea WHERE id_companhia = codCompanhiaAlterar;
	
	if(@existe)
		then
			UPDATE tb_companhiaaerea SET
				nomeCompanhia = nomeCompanhiaAlterar,
				cnpj = cnpjAlterar,
				emailOficial = emailOficialAlterar,
				statos = statusAlterar
				WHERE id_companhia = codCompanhiaAlterar;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Código inexistente";
	END if;

END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_alteraFabricante
DROP PROCEDURE IF EXISTS `proc_alteraFabricante`;
DELIMITER //
CREATE PROCEDURE `proc_alteraFabricante`(
	IN `codFabricanteAlterar` INT,
	IN `nomeFabricanteAlterar` INT,
	IN `paisOrigemAlterar` INT,
	IN `sedeAlterar` INT
)
BEGIN
	SELECT COUNT(*) INTO @exite FROM tb_fabricante WHERE id_fabricante = codFabricanteAlterar;
	
	if(@existe)
		then
			UPDATE tb_fabricante SET
				nomeFabricante = nomeFabricanteAlterar,
				paisOrigem = paisOrigemAlterar,
				sede = sedeAlterar
				WHERE id_fabricante = codFabricanteAlterar;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Código inexistente";
	END if;
END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_alteraFuncionario
DROP PROCEDURE IF EXISTS `proc_alteraFuncionario`;
DELIMITER //
CREATE PROCEDURE `proc_alteraFuncionario`(
	IN `codAlterar` INT,
	IN `nomeAlterar` VARCHAR(50),
	IN `cpfAlterar` VARCHAR(50),
	IN `salarioAlterar` DOUBLE,
	IN `cargoAlterar` VARCHAR(50),
	IN `emailAlterar` VARCHAR(50),
	IN `telefoneAlterar` VARCHAR(50),
	IN `statosAlterar` VARCHAR(50),
	IN `companhiaAlterar` INT
)
BEGIN

	SELECT COUNT(*) 
	INTO @existe FROM tb_funcionarios WHERE id_funcionarios = codAlterar;
	if (@existe)
		then UPDATE tb_funcionarios SET nomeFuncionario = nomeAlterar, cpfFuncionario = cpfAlterar,
		 cargoFuncionario = cargoAlterar, emailFuncionario=emailAlterar, telefoneFuncionario=telefoneAlterar, statusFuncionario=statosAlterar, 
		 salarioFuncionario=salarioAlterar, tb_companhiaAerea_id=companhiaAlterar
		 WHERE codCliente = codAlterar;
		ELSE SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Funcionario inexistente"; 
	END if;
	
	SELECT * FROM tb_funcionarios;

END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_alteraManutencao
DROP PROCEDURE IF EXISTS `proc_alteraManutencao`;
DELIMITER //
CREATE PROCEDURE `proc_alteraManutencao`(
	IN `manutencaoAlterar` VARCHAR(150),
	IN `descricaoAlterar` VARCHAR(150),
	IN `data_inicioAlterar` DATE,
	IN `data_fimAlterar` DATE,
	IN `custoAlterar` DOUBLE,
	IN `statos_Alterar` VARCHAR(50),
	IN `tb_avioes_idAlterar` INT,
	IN `codAlterar` INT
)
BEGIN

 	SELECT COUNT(*) 
	INTO @existe FROM tb_manutencao WHERE id_manutencao = codAlterar;
	if (@existe)
		then UPDATE tb_manutencao SET tipoManutencao=manutencaoAlterar, descricao=descricaoAlterar, data_inicio=data_inicioAlterar,
		 data_fim=data_fimAlterar, custo=custoAlterar, statos=statos_Alterar, tb_avioes_id=tb_avioes_idAlterar
		 WHERE id_manutencao = codAlterar;
		ELSE SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Manutenção inexistente"; 
	END if;
	
	SELECT * FROM tb_manutencao;


END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_alteraPassageiro
DROP PROCEDURE IF EXISTS `proc_alteraPassageiro`;
DELIMITER //
CREATE PROCEDURE `proc_alteraPassageiro`(
	IN `nomeNovo` VARCHAR(50),
	IN `emailNovo` VARCHAR(50),
	IN `telefoneNovo` VARCHAR(50),
	IN `codAlterar` INT
)
BEGIN


 	SELECT COUNT(*) 
	INTO @existe FROM tb_passageiro WHERE id_passageiro = codAlterar;
	if (@existe)
		then UPDATE tb_passageiro SET  nomePassageiro=nomeNovo, emailPassageiro=emailNovo, telefonePassageiro=telefoneNovo
		
		 WHERE id_passageiro = codAlterar;
		 
		ELSE SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Passageiro inexistente"; 
	END if;
	
	SELECT * FROM tb_passageiro;

END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_alteraPassagem
DROP PROCEDURE IF EXISTS `proc_alteraPassagem`;
DELIMITER //
CREATE PROCEDURE `proc_alteraPassagem`(
	IN `codAlterar` INT,
	IN `alteraNumeroPassagem` VARCHAR(45),
	IN `alteraClassePassagem` VARCHAR(45),
	IN `alteraDataDeVoo` DATE,
	IN `alteraDestinoPassagem` VARCHAR(45),
	IN `alteraPrecoPassagem` DOUBLE,
	IN `alteraAssentoPassagem` VARCHAR(10),
	IN `alteraTB_voos_id` INT,
	IN `alteraTB_passageiro_id` INT,
	IN `alteraTB_pagamento_id` INT
)
BEGIN
	SELECT COUNT(*) 
	INTO @existe FROM tb_passagem WHERE id_passagem = codAlterar;
	if (@existe)
		then UPDATE tb_passagem SET numeroPassagem = alteraNumeroPassagem, classePassagem = alteraClassePassagem, dataDeVoo = alteraDataDeVoo, destinoPassagem = alteraDestinoPassagem,
		 precoPassagem = alteraPrecoPassagem, assentoPassagem = alteraAssentoPassagem, tb_voos_id = alteraTB_voos_id, tb_passageiro_id = alteraTB_passageiro_id, tb_pagamento_id = alteraTB_pagamento_id
		 WHERE codCliente = codAlterar;
		ELSE SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Passagem inexistente"; 
	END if;
	
	SELECT * FROM tb_passagem;

END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_alteraVoos
DROP PROCEDURE IF EXISTS `proc_alteraVoos`;
DELIMITER //
CREATE PROCEDURE `proc_alteraVoos`(
	IN `codAlterar` INT,
	IN `alteraNumVoo` VARCHAR(45),
	IN `alteraStatusVoo` VARCHAR(45),
	IN `alteraTB_avioes_id` INT,
	IN `alteraTB_aeroportos_id` INT
)
BEGIN
	SELECT COUNT(*) 
	INTO @existe FROM tb_voos WHERE id_voo = codAlterar;
	if (@existe)
		then UPDATE tb_voos SET numVoo = alteraNumVoo, statusVoo = alteraStatusVoo, tb_avioes_id = alteraTB_avioes_id, tb_aeroportos_id = alteraTB_aeroportos_id
		 WHERE id_voos = codAlterar;
		ELSE SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Voo inexistente"; 
	END if;
	
	SELECT * FROM tb_voos;
END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_insereAeroporto
DROP PROCEDURE IF EXISTS `proc_insereAeroporto`;
DELIMITER //
CREATE PROCEDURE `proc_insereAeroporto`(
	IN `insIata` CHAR(3),
	IN `insIcao` CHAR(4),
	IN `insLatitude` VARCHAR(50),
	IN `insLongitude` VARCHAR(50),
	IN `insElevacaoMetros` INT,
	IN `insTamanhoPista` INT,
	IN `insStatus` VARCHAR(45)
)
BEGIN
	INSERT INTO tb_aeroportos(
		codigo_iata,
		codigo_icao,
		latitude,
		longitude,
		elevacao_metros,
		tamanhoPista,
		statos
	)
	VALUES(
		insIata,
		insIcao,
		insLatitude,
		insLongitude,
		insElevacaoMetros,
		insTamanhoPista,
		insStatus
	);
END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_insereAvioes
DROP PROCEDURE IF EXISTS `proc_insereAvioes`;
DELIMITER //
CREATE PROCEDURE `proc_insereAvioes`(
	IN `insFabricante` VARCHAR(100),
	IN `insModelo` VARCHAR(100),
	IN `insAnoFabricacao` DATE,
	IN `insCapacidadeCarga` DOUBLE,
	IN `insTB_manutencao_id` INT,
	IN `insTB_companhiaAerea_id` INT
)
BEGIN
	INSERT INTO tb_avioes(
		fabricante,
		modelo,
		anoFabricacao,
		capacidadeCarga,
		tb_manutencao_id,
		tb_companhiaAerea_id
	)
	VALUES(
		insFabricante,
		insModelo,
		isnAnoFabricacao,
		insCapacidadeCarga,
		insTB_manutencao_id,
		insTB_companhiaAerea_id
	);
END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_insereCompanhiaAerea
DROP PROCEDURE IF EXISTS `proc_insereCompanhiaAerea`;
DELIMITER //
CREATE PROCEDURE `proc_insereCompanhiaAerea`()
BEGIN
	INSERT INTO tb_companhiaaerea(
		nomeCompanhia,
		cnpj,
		emailOficial,
		statos
	)
	
	VALUES(
		insCompanhia,
		insCNPJ,
		insEmail,
		insStatus
	);
END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_insereFabricante
DROP PROCEDURE IF EXISTS `proc_insereFabricante`;
DELIMITER //
CREATE PROCEDURE `proc_insereFabricante`(
	IN `insNomeFabricante` VARCHAR(50),
	IN `insPaisOrigem` VARCHAR(50),
	IN `insSede` VARCHAR(50)
)
BEGIN
	INSERT INTO tb_fabricante(
		nomeFabricante,
		paisOrigem,
		sede
	)
	VALUES(
		insNomeFabricante,
		insPaisOrigem,
		insSede
	);
END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_insereFuncionario
DROP PROCEDURE IF EXISTS `proc_insereFuncionario`;
DELIMITER //
CREATE PROCEDURE `proc_insereFuncionario`(
	IN `insNomeFuncionario` VARCHAR(50),
	IN `insCPF` VARCHAR(50),
	IN `insCargo` VARCHAR(50),
	IN `insEmail` VARCHAR(50),
	IN `insTelefoneFuncionario` VARCHAR(50),
	IN `insStatus` VARCHAR(50),
	IN `insSalario` DOUBLE,
	IN `insTB_companhiaAerea_id` INT
)
BEGIN

	INSERT INTO tb_funcionarios(
		nomeFuncionario, 
		cpfFuncionario, 
		cargoFuncionario, 
		emailFuncionario,
		telefoneFuncionario, 
		statusFuncionario, 
		salarioFuncionario, 
		tb_companhiaAerea_id
	) 
	VALUES(
		insNomeFuncionario, 
		insCPF, 
		insCargo, 
		insEmail, 
		insTelefoneFuncionario, 
		insStatus, 
		insSalario, 
		insTB_companhiaAerea_id
	);
	SELECT * FROM tb_funcionarios;

END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_insereManutencao
DROP PROCEDURE IF EXISTS `proc_insereManutencao`;
DELIMITER //
CREATE PROCEDURE `proc_insereManutencao`(
	IN `insTipo` VARCHAR(150),
	IN `insDataInicio` DATE,
	IN `insDataFim` DATE,
	IN `insDescricao` MEDIUMTEXT,
	IN `insCusto` DOUBLE,
	IN `insStatus` VARCHAR(50),
	IN `insTB_avioes_id` INT
)
BEGIN



	INSERT INTO tb_manutencao(
		tipoManutencao, 
		descricao, 
		data_inicio, 
		data_fim, 
		custo, 
		statos, 
		tb_avioes_id
	) 
	VALUES(
		insTipo,
		insDataInicio,
		insDataFim,
		insDescricao,
		insCusto,
		insStatus,
		insTB_avioes_id
	);
	SELECT * FROM tb_manutencao;


END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_inserePassageiro
DROP PROCEDURE IF EXISTS `proc_inserePassageiro`;
DELIMITER //
CREATE PROCEDURE `proc_inserePassageiro`(
	IN `insNome` VARCHAR(150),
	IN `insEmail` VARCHAR(50),
	IN `insTelefonePassageiro` VARCHAR(50)
)
BEGIN

 	INSERT INTO tb_passageiro(
		nomePassageiro, 
		emailPassageiro, 
		telefonePassageiro
	) 
	VALUES(
		insNome, 
		insEmail, 
		insTelefonePassageiro
	);
	SELECT * FROM tb_passageiro;

END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_inserePassagem
DROP PROCEDURE IF EXISTS `proc_inserePassagem`;
DELIMITER //
CREATE PROCEDURE `proc_inserePassagem`(
	IN `insNumeroPassagem` VARCHAR(45),
	IN `insClassePassagem` VARCHAR(45),
	IN `insDataDeVoo` DATE,
	IN `insDestinoPassagem` VARCHAR(45),
	IN `insPrecoPassagem` DOUBLE,
	IN `insAssentoPassagem` VARCHAR(10),
	IN `insTB_voos_id` INT,
	IN `insTB_passageiro_id` INT,
	IN `insTB_pagamento_id` INT
)
BEGIN

	INSERT INTO tb_passagem 
	VALUES(
		NULL, 
		insNumeroPassagem, 
		insClassePassagem, 
		insDataDeVoo, 
		insDestinoPassagem, 
		insPrecoPassagem,
		insAssentoPassagem, 
		insTB_voos_id, 
		insTB_passageiro_id, 
		insTB_pagamento_id
	);
	
	SELECT * FROM tb_passagem;
END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_insereTripulacao
DROP PROCEDURE IF EXISTS `proc_insereTripulacao`;
DELIMITER //
CREATE PROCEDURE `proc_insereTripulacao`(
	IN `insTipoTripulante` VARCHAR(45)
)
BEGIN

	INSERT INTO tb_tripulacao(
		tipoTripulante
	) 
	VALUES(
		insTipoTripulante
	);
END//
DELIMITER ;

-- Copiando estrutura para procedure sistemadetransporteaereo.proc_insereVoos
DROP PROCEDURE IF EXISTS `proc_insereVoos`;
DELIMITER //
CREATE PROCEDURE `proc_insereVoos`(
	IN `insNumVoo` VARCHAR(45),
	IN `insTB_avioes_id` INT,
	IN `insTB_aeroportos_id` INT
)
BEGIN
	INSERT INTO tb_voos(
		numVoo,
		tb_avioes_id,
		tb_aeroportos_id
	)
	VALUES(
		NULL, 
		insNumVoo,
		insTB_avioes_id, 
		insTB_aeroportos_id
	);
	SELECT * FROM tb_voos;
END//
DELIMITER ;

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_aeroportos
DROP TABLE IF EXISTS `tb_aeroportos`;
CREATE TABLE IF NOT EXISTS `tb_aeroportos` (
  `id_aeroporto` int NOT NULL AUTO_INCREMENT,
  `codigo_iata` char(3) COLLATE utf8mb3_bin NOT NULL,
  `codigo_icao` char(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `latitude` varchar(50) COLLATE utf8mb3_bin NOT NULL DEFAULT '0',
  `longitude` varchar(50) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `elevacao_metros` int NOT NULL,
  `tamanhoPista` int NOT NULL DEFAULT (0),
  `statos` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
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
  `statos` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
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
  `statos` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id_companhiaAerea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Copiando dados para a tabela sistemadetransporteaereo.tb_companhiaaerea: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sistemadetransporteaereo.tb_fabricante
DROP TABLE IF EXISTS `tb_fabricante`;
CREATE TABLE IF NOT EXISTS `tb_fabricante` (
  `id_fabricante` int NOT NULL,
  `nomeFabricante` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
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
  `tipoManutencao` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `descricao` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `custo` double NOT NULL DEFAULT (0),
  `statos` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
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
  `quantParcelas` bit(1) DEFAULT NULL,
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
