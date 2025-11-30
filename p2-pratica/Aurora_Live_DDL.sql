CREATE database Aurora_Livre;

Use Aurora_Livre;

CREATE TABLE categoria(
id INT PRIMARY KEY NOT NULL,
nome VARCHAR(255) UNIQUE,
estado ENUM('ativa', 'desativa') DEFAULT 'ativa'
);

CREATE TABLE palestrante(
id INT PRIMARY KEY NOT NULL,
nome_artistico VARCHAR(255) NOT NULL
);

CREATE TABLE local_evento(
id INT PRIMARY KEY NOT NULL,
identificacao VARCHAR(255) NOT NULL,
endereco VARCHAR(255) NOT NULL,
cidade VARCHAR(255) NOT NULL,
estado VARCHAR(255) NOT NULL,
capacidade_maxima INT NOT NULL CHECK (capacidade_maxima > 0)
);

CREATE TABLE evento(
id INT PRIMARY KEY NOT NULL,
titulo VARCHAR(255) NOT NULL,
descricao VARCHAR(255) NOT NULL,
curadoria VARCHAR(255) NOT NULL,

id_categoria INT NOT NULL,
CONSTRAINT fk_id_categoria
  FOREIGN KEY (id_categoria) REFERENCES categoria(id),
  
id_local_evento INT NOT NULL,
CONSTRAINT fk_id_local_evento
   FOREIGN KEY (id_local_evento) REFERENCES local_evento(id)
   ON UPDATE CASCADE
);

CREATE TABLE evento_has_palestrante(
id INT NOT NULL PRIMARY KEY,
id_palestrante INT NOT NULL,
id_evento INT NOT NULL,
papel ENUM('headliner', 'convidado', 'palestrante principal'),

CONSTRAINT fk_id_palestrante
    FOREIGN KEY (id_palestrante) REFERENCES palestrante(id),

CONSTRAINT fk_id_evento_palestra
    FOREIGN KEY (id_evento) REFERENCES evento(id)
);
 
CREATE TABLE sessao(
id INT PRIMARY KEY NOT NULL,
codigo INT NOT NULL UNIQUE,
data_evento DATE NOT NULL,
horario TIME NOT NULL,
estado ENUM('aberta', 'esgotada', 'fechada'),

id_evento INT NOT NULL,
CONSTRAINT fk_id_evento
  FOREIGN KEY (id_evento) REFERENCES evento(id)
);

CREATE TABLE ingresso(
id INT PRIMARY KEY NOT NULL,
tipo ENUM('vip', 'pista', 'meia', 'inteira'),
preco_vigente DOUBLE NOT NULL,
quantidade_total INT DEFAULT 0,
quantidade_vendida INT DEFAULT 0,

id_sessao INT NOT NULL,
CONSTRAINT fk_id_sessao
   FOREIGN KEY (id_sessao) REFERENCES sessao(id)
);

CREATE TABLE cliente(
id INT PRIMARY KEY NOT NULL,
nome VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
tipo_documento ENUM('cpf', 'rg') DEFAULT 'cpf',
documento varchar(11)
);

CREATE TABLE checkin(
id INT PRIMARY KEY NOT NULL,
data_hora TIMESTAMP,
estado ENUM('valido', 'invalido') DEFAULT 'valido',

id_sessao INT NOT NULL,
CONSTRAINT fk_id_sessao_checkin
   FOREIGN KEY (id_sessao) REFERENCES sessao(id),

id_cliente INT NOT NULL,
CONSTRAINT fk_id_cliente 
   FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE item(
id INT PRIMARY KEY NOT NULL,
valor_unitario DOUBLE(10, 2) NOT NULL CHECK (valor_unitario > 0),

id_ingresso INT NOT NULL,
CONSTRAINT fk_id_ingresso
	FOREIGN KEY (id_ingresso) REFERENCES ingresso(id)
);

CREATE TABLE pedido(
id INT PRIMARY KEY NOT NULL,
estado ENUM('aberto', 'pago', 'cancelado'),

id_item INT NOT NULL,
CONSTRAINT fk_id_item
  FOREIGN KEY (id_item) REFERENCES item(id),

id_cliente INT NOT NULL,
CONSTRAINT fk_id_cliente_pedido
  FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE pagamento(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
valor DOUBLE(10, 2) NOT NULL,
data_pagamento DATE NOT NULL,
tipo ENUM('credito', 'pix', 'debito', 'dinheiro'),
estado ENUM('aprovado', 'pendente', 'estornado'),

id_pedido INT NOT NULL,
CONSTRAINT fk_id_pedido
  FOREIGN KEY(id_pedido) REFERENCES pedido(id)
);

/**Consultar evento por data e horario**/
CREATE INDEX idx_sessao_evento_data 
ON sessao (id_evento, data_evento, horario);

/**Consultar ingresso por sessão ou tipo**/
CREATE INDEX idx_ingresso_id_sessao ON ingresso(id_sessao);
CREATE INDEX idx_ingresso_tipo ON ingresso(tipo);

