
/*
FEITO POR: 
	MURILLO PINHEIRO DE OLIVERA - 1999341
    LUCAS SPILA SERENO			- 1996727
*/

CREATE DATABASE oficina;

USE oficina;

CREATE table cliente (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
telefone VARCHAR(12) NOT NULL,
email VARCHAR(50) NOT NULL
);

CREATE table veiculo (
id INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR(100) NOT NULL,
marca VARCHAR(100) NOT NULL,	
placa CHAR(7) NOT NULL,
ano_fabricacao YEAR,
quilometragem INT,

/*Chaves estrangeiras */
id_cliente int NOT NULL

CHECK (quilometragem >= 0)
);

CREATE table servico (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
descricao VARCHAR(255) DEFAULT 'Serviço da Nubes Oficina Mecânica',
preco DOUBLE NOT NULL,

CHECK (preco > 0.0)
);

CREATE table agendamento (
id INT PRIMARY KEY AUTO_INCREMENT,
data_servico DATETIME NOT NULL UNIQUE,
status_servico ENUM('Concluido', 'Em andamento', 'Pendente') default 'Pendente',

/* Chaves estrangeiras */
id_veiculo INT NOT NULL,
id_servico INT NOT NULL
)
