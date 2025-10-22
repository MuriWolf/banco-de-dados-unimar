/* inserts */    
INSERT INTO cliente(nome, telefone, email)
VALUES
	("Rogerio Vasconcelos", "972345168912", "rogerio.vasc@gmail.com"),
    ("Lucas Marques", "913654897563", "marques.lucs@gmail.com"),
    ("William Brandino", "972345168912", "william.brandino@gmail.com");
 
/* selects */ 
SELECT * FROM cliente; 
SELECT * FROM cliente WHERE email LIKE "%@gmail%" LIMIT 2; 
SELECT id, nome FROM cliente WHERE id = 1; 
 
/* updates */    
UPDATE cliente
SET telefone = "988845368913"
WHERE id = 1;

UPDATE cliente
SET email = "mudei.email.da.silva@gmail.com"
WHERE id = 2;

UPDATE cliente
SET email = "brooklyn.ny@gmail.com"
WHERE id = 3;

/* deletes */    
DELETE FROM cliente WHERE id = 3;
    
/* ====================================================================================== */   
    
/* inserts */   
INSERT INTO veiculo(modelo, marca, placa, ano_fabricacao, quilometragem, id_cliente)
VALUES
	("GC2 1.0 12V 68cv 5p", "GEELY", "MLU1800", 1988, 12321, 1),
    ("Buggy 2000W 1.6 8V", "Fyber", "MZY9401", 2016, 30011, 2),
    ("Engesa 4x4 4.0 Diesel", "Engesa", "MUK1400", 1986, 123121, 1);
    
/* selects */  
SELECT * FROM veiculo;
SELECT id, marca, ano_fabricacao FROM veiculo WHERE ano_fabricacao > 2012;
SELECT id, placa, quilometragem FROM veiculo WHERE placa LIKE "%00%";

/* updates */    
UPDATE veiculo
SET marca = "GELAO"
WHERE id = 1;

UPDATE veiculo
SET quilometragem = 1
WHERE id = 2;

UPDATE veiculo
SET placa = "HPV7977"
WHERE id = 3;
 
/* deletes */ 
DELETE FROM veiculo WHERE id = 3;

/* ====================================================================================== */

/* inserts */    
INSERT INTO servico(nome, descricao, preco)
VALUES
	("Manutenção preventiva e corretiva", "Troca de óleo e filtros, alinhamento e balanceamento, e reparos em freios, suspensão e moto", 379),
    ("Reparo de freios", "Conserto e substituição de peças do sistema de freio para garantir a segurança. 
", 593),
    ("Manutenção de suspensão", "Verificação e reparo de componentes do sistema de suspensão. ", 197);
    
/* selects */      
SELECT * FROM servico;
SELECT id, nome, preco FROM servico WHERE preco > 200 LIMIT 10;
SELECT id, descricao FROM servico WHERE descricao LIKE "%reparo%";

/* updates */    
UPDATE servico
SET descricao = "Substituição de peças do sistema"
WHERE id = 1;

UPDATE servico
SET preco = 239
WHERE id = 3;

UPDATE servico
SET preco = 299
WHERE 1;

/* deletes */    
DELETE FROM servico WHERE id = 3;

/* ====================================================================================== */

/* inserts */   
INSERT INTO agendamento(data_servico, status_servico, id_veiculo, id_servico)
VALUES
	("2025-10-25 14:32:00", "Pendente", 1, 1),
    ("2025-10-12 11:00:00", "Concluido", 2, 2),
    ("2025-10-30 09:30:00", "Em andamento", 2, 1);
    
/* selects */      
SELECT * FROM agendamento;
SELECT id, data_servico, status_servico FROM agendamento WHERE data_servico BETWEEN '2025-10-09 00:00:00' AND '2025-10-20 23:59:59';
SELECT id, data_servico, status_servico FROM agendamento WHERE id = 8; 

/* updates */    
UPDATE agendamento 
SET data_servico = "2025-10-10 14:00:00"
where id = 1;

UPDATE agendamento
SET status_servico = "Concluido"
Where id = 2;

UPDATE agendamento
SET data_servico = "2025-10-14 12:30:00"
where id = 3;

/* deletes */    
DELETE FROM agendamento WHERE id = 1;
