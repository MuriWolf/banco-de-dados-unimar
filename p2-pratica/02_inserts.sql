USE Aurora_Live;

-- Categorias (5)
INSERT INTO categoria (id, nome, estado) VALUES
(1, 'Show', 'ativa'),
(2, 'Palestra', 'ativa'),
(3, 'Workshop', 'ativa'),
(4, 'Festival', 'ativa'),
(5, 'Teatro', 'ativa');

-- Locais (5)	
INSERT INTO local_evento (id, identificacao, endereco, cidade, estado, capacidade_maxima) VALUES
(1, 'Arena SP', 'Rua A 1', 'São Paulo', 'SP', 5000),
(2, 'Teatro RJ', 'Av B 2', 'Rio de Janeiro', 'RJ', 1000),
(3, 'Auditório MG', 'Praça C 3', 'Belo Horizonte', 'MG', 800),
(4, 'Estádio RS', 'Rua D 4', 'Porto Alegre', 'RS', 20000),
(5, 'Centro BA', 'Av E 5', 'Salvador', 'BA', 1500);

-- Artistas (10)
INSERT INTO palestrante (id, nome_artistico) VALUES
(1, 'Maroon 5'),
(2, 'Taylor Swift'),
(3, 'Ed Sheeran'),
(4, 'Beyonce'),
(5, 'Coldplay'),
(6, 'Drake'),
(7, 'Ariana Grande'),
(8, 'Post Malone'),
(9, 'Billie Eilish'),
(10, 'The Weeknd');

-- Eventos (12)
INSERT INTO evento (id, titulo, descricao, curadoria, id_categoria, id_local_evento) VALUES
(1, 'Noite de Bruno', 'Show incrível', 'Equipe Aurora', 1, 1),
(2, 'Palestra de Carlos', 'Debate atual', 'Produtora XYZ', 2, 2),
(3, 'Workshop de Diana', 'Técnicas avançadas', 'Curadoria Especial', 3, 3),
(4, 'Festival de Eduardo', 'Experiência única', 'Equipe Aurora', 4, 4),
(5, 'Teatro de Fernanda', 'Concerto memorável', 'Produtora XYZ', 5, 5),
(6, 'Show de Gabriel', 'Muita música', 'Curadoria Especial', 1, 1),
(7, 'Palestra de Helena', 'Temas atuais', 'Equipe Aurora', 2, 2),
(8, 'Workshop de Igor', 'Aula prática', 'Produtora XYZ', 3, 3),
(9, 'Festival de Julia', 'Evento incrível', 'Curadoria Especial', 4, 4),
(10, 'Teatro de Kevin', 'Debate', 'Equipe Aurora', 5, 5),
(11, 'Show de Laura', 'Música ao vivo', 'Produtora XYZ', 1, 1),
(12, 'Palestra de Marcelo', 'Aprendizado', 'Curadoria Especial', 2, 2);

-- Evento has palestrante
INSERT INTO evento_has_palestrante (id, id_palestrante, id_evento, papel) VALUES
(1, 1, 1, 'headliner'),
(2, 2, 1, 'convidado'),
(3, 3, 2, 'palestrante principal'),
(4, 4, 3, 'headliner'),
(5, 5, 4, 'convidado'),
(6, 6, 5, 'palestrante principal'),
(7, 7, 6, 'headliner'),
(8, 8, 7, 'convidado'),
(9, 9, 8, 'palestrante principal'),
(10, 10, 9, 'headliner'),
(11, 1, 10, 'convidado'),
(12, 2, 11, 'headliner'),
(13, 3, 12, 'palestrante principal');

-- Sessões (30)
INSERT INTO sessao (id, codigo, data_evento, horario, estado, id_evento) VALUES
(1, 1, '2024-01-15', '19:00:00', 'esgotada', 1),
(2, 2, '2024-02-20', '21:00:00', 'fechada', 1),
(3, 3, '2024-03-10', '16:00:00', 'fechada', 2),
(4, 4, '2024-04-05', '14:00:00', 'esgotada', 2),
(5, 5, '2024-05-12', '19:00:00', 'fechada', 3),
(6, 6, '2024-06-18', '21:00:00', 'fechada', 3),
(7, 7, '2024-07-22', '16:00:00', 'fechada', 4),
(8, 8, '2024-08-30', '14:00:00', 'fechada', 4),
(9, 9, '2024-09-14', '19:00:00', 'fechada', 5),
(10, 10, '2024-10-20', '21:00:00', 'fechada', 5),
(11, 11, '2024-11-25', '16:00:00', 'fechada', 6),
(12, 12, '2025-01-08', '14:00:00', 'fechada', 6),
(13, 13, '2025-02-15', '19:00:00', 'fechada', 7),
(14, 14, '2025-03-22', '21:00:00', 'fechada', 7),
(15, 15, '2025-04-10', '16:00:00', 'fechada', 8),
(16, 16, '2025-05-17', '14:00:00', 'fechada', 8),
(17, 17, '2025-06-24', '19:00:00', 'fechada', 9),
(18, 18, '2025-07-31', '21:00:00', 'fechada', 9),
(19, 19, '2025-08-07', '16:00:00', 'fechada', 10),
(20, 20, '2025-09-14', '14:00:00', 'fechada', 10),
(21, 21, '2025-10-21', '19:00:00', 'fechada', 11),
(22, 22, '2025-11-28', '21:00:00', 'fechada', 11),
(23, 23, '2025-12-05', '16:00:00', 'aberta', 12),
(24, 24, '2026-01-12', '14:00:00', 'aberta', 12),
(25, 25, '2024-01-20', '19:00:00', 'fechada', 1),
(26, 26, '2024-02-25', '21:00:00', 'fechada', 2),
(27, 27, '2024-03-15', '16:00:00', 'fechada', 3),
(28, 28, '2024-04-10', '14:00:00', 'fechada', 4),
(29, 29, '2024-05-17', '19:00:00', 'fechada', 5),
(30, 30, '2024-06-24', '21:00:00', 'fechada', 6);

-- Ingressos (4 tipos por sessão, alguns esgotados, quantidade_vendida set)
INSERT INTO ingresso (id, tipo, preco_vigente, quantidade_total, quantidade_vendida, id_sessao) VALUES
(1, 'vip', 250.00, 50, 50, 1), -- esgotado
(2, 'pista', 120.00, 100, 50, 1),
(3, 'meia', 60.00, 50, 20, 1),
(4, 'inteira', 100.00, 80, 30, 1),
(5, 'vip', 230.00, 40, 0, 2),
(6, 'pista', 110.00, 90, 10, 2),
(7, 'meia', 55.00, 40, 5, 2),
(8, 'inteira', 90.00, 70, 15, 2),
(9, 'vip', 240.00, 30, 15, 3),
(10, 'pista', 115.00, 80, 40, 3),
(11, 'meia', 58.00, 35, 0, 3),
(12, 'inteira', 95.00, 60, 20, 3),
(13, 'vip', 260.00, 60, 60, 4), -- esgotado
(14, 'pista', 130.00, 120, 60, 4),
(15, 'meia', 65.00, 55, 25, 4),
(16, 'inteira', 105.00, 90, 45, 4);

-- Clientes (30)
INSERT INTO cliente (id, nome, email, tipo_documento, documento) VALUES
(1, 'Ana Silva', 'ana_1@silva.com', 'cpf', '12345678901'),
(2, 'Bruno Santos', 'bruno_2@santos.com', 'cpf', '23456789012'),
(3, 'Carlos Oliveira', 'carlos_3@oliveira.com', 'cpf', '34567890123'),
(4, 'Diana Souza', 'diana_4@souza.com', 'cpf', '45678901234'),
(5, 'Eduardo Rodrigues', 'eduardo_5@rodrigues.com', 'cpf', '56789012345'),
(6, 'Fernanda Ferreira', 'fernanda_6@ferreira.com', 'cpf', '67890123456'),
(7, 'Gabriel Alves', 'gabriel_7@alves.com', 'cpf', '78901234567'),
(8, 'Helena Pereira', 'helena_8@pereira.com', 'cpf', '89012345678'),
(9, 'Igor Lima', 'igor_9@lima.com', 'cpf', '90123456789'),
(10, 'Julia Gomes', 'julia_10@gomes.com', 'cpf', '01234567890'),
(11, 'Kevin Silva', 'kevin_11@silva.com', 'cpf', '12345678901'),
(12, 'Laura Santos', 'laura_12@santos.com', 'cpf', '23456789012'),
(13, 'Marcelo Oliveira', 'marcelo_13@oliveira.com', 'cpf', '34567890123'),
(14, 'Natalia Souza', 'natalia_14@souza.com', 'cpf', '45678901234'),
(15, 'Otavio Rodrigues', 'otavio_15@rodrigues.com', 'cpf', '56789012345'),
(16, 'Paula Ferreira', 'paula_16@ferreira.com', 'cpf', '67890123456'),
(17, 'Quintino Alves', 'quintino_17@alves.com', 'cpf', '78901234567'),
(18, 'Rafaela Pereira', 'rafaela_18@pereira.com', 'cpf', '89012345678'),
(19, 'Sergio Lima', 'sergio_19@lima.com', 'cpf', '90123456789'),
(20, 'Tatiana Gomes', 'tatiana_20@gomes.com', 'cpf', '01234567890'),
(21, 'Ursula Silva', 'ursula_21@silva.com', 'cpf', '12345678902'),
(22, 'Victor Santos', 'victor_22@santos.com', 'cpf', '23456789013'),
(23, 'Wanda Oliveira', 'wanda_23@oliveira.com', 'cpf', '34567890124'),
(24, 'Xavier Souza', 'xavier_24@souza.com', 'cpf', '45678901235'),
(25, 'Yasmin Rodrigues', 'yasmin_25@rodrigues.com', 'cpf', '56789012346'),
(26, 'Zoe Ferreira', 'zoe_26@ferreira.com', 'cpf', '67890123457'),
(27, 'Alice Alves', 'alice_27@alves.com', 'cpf', '78901234568'),
(28, 'Bob Pereira', 'bob_28@pereira.com', 'cpf', '89012345679'),
(29, 'Clara Lima', 'clara_29@lima.com', 'cpf', '90123456780'),
(30, 'David Gomes', 'david_30@gomes.com', 'cpf', '01234567891');

-- Itens, Pedidos, Pagamentos (consistentes, alguns cancelados, esgot refletido em vendida)
INSERT INTO item (id, valor_unitario, id_ingresso) VALUES
(1, 250.00, 1),
(2, 250.00, 1),
(3, 250.00, 1),
(4, 250.00, 1),
(5, 250.00, 1);

INSERT INTO pedido (id, estado, id_item, id_cliente) VALUES
(1, 'pago', 1, 1),
(2, 'cancelado', 2, 2),
(3, 'aberto', 3, 3),
(4, 'pago', 4, 4),
(5, 'pago', 5, 5);

INSERT INTO pagamento (id, valor, data_pagamento, tipo, estado, id_pedido) VALUES
(1, 250.00, '2024-01-10', 'credito', 'aprovado', 1),
(2, 250.00, '2024-01-12', 'pix', 'aprovado', 4),
(3, 250.00, '2024-01-14', 'debito', 'aprovado', 5);

-- Checkins (alguns válidos para sessões passadas, clientes com pedido pago)
INSERT INTO checkin (id, data_hora, estado, id_sessao, id_cliente) VALUES
(1, '2024-01-15 19:30:00', 'valido', 1, 1),
(2, '2024-01-15 19:45:00', 'valido', 1, 4),
(3, '2024-01-15 20:00:00', 'invalido', 1, 5); -- example for past session
