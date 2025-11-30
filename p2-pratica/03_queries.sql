Use Aurora_Live; 

-- buscas gerais
select * from sessao;
select * from evento;
select * from local_evento;
select * from categoria;

-- 1.
select e.id, e.titulo, c.nome as 'categoria' from evento e
inner join categoria c on e.id_categoria = c.id
where c.estado = 'ativa'
order by categoria, titulo;

-- 2.
select e.titulo as 'titulo_evento', s.data_evento, s.horario
from sessao s 
inner join evento e on e.id = s.id_evento
where
	s.estado = 'aberta' and
    s.data_evento between '2025-12-01' and '2025-12-31';
    
-- 3. Termo de busca: ra
select * from palestrante
where nome_artistico like '%ra%'
order by nome_artistico asc;

-- 4. Id local evento buscado: 1
select e.titulo as 'titulo_evento', le.identificacao as 'nome_local', c.nome as 'categoria' from evento e 
inner join local_evento le on e.id_local_evento = le.id
inner join categoria c on e.id_categoria = c.id
where le.id = 1;

-- 5. Sessões com metadados (visão completa por sessão)
SELECT 
    s.codigo AS codigo_sessao,
    e.titulo AS titulo_evento,
    c.nome AS categoria,
    l.identificacao AS local,
    CONCAT(s.data_evento, ' ', s.horario) AS data_hora
FROM sessao s
JOIN evento e 
    ON s.id_evento = e.id
JOIN categoria c 
    ON e.id_categoria = c.id
JOIN local_evento l
    ON e.id_local_evento = l.id
ORDER BY s.data_evento DESC, s.horario DESC;

-- 6 Pedidos por status (últimos 30 dias)
SELECT 
    p.estado,
    COUNT(*) AS total
FROM pedido AS p
LEFT JOIN pagamento AS pg
    ON pg.id_pedido = p.id
     AND pg.data_pagamento >= '2024-01-01'
     AND pg.data_pagamento <  '2024-02-01'
GROUP BY p.estado
ORDER BY total DESC;

-- 7 Top categorias por eventos ativos

SELECT c.nome as categoria, count(e.id) as total_evento FROM evento e
JOIN categoria c ON c.id = e.id_categoria
WHERE c.estado = 'ativa'
GROUP BY c.id, c.nome
ORDER BY total_evento DESC
LIMIT 5;


-- 8 Clientes com compras no mês atual
SELECT  c.id, c.nome FROM pedido p
JOIN cliente c ON c.id = p.id_cliente
JOIN pagamento pg ON p.id = pg.id_pedido
WHERE pg.data_pagamento = MONTH(CURDATE());

-- exercicio 9
SELECT 
    c.nome AS categoria, 
    SUM(i.quantidade_vendida) AS total_vendido,
    SUM(i.quantidade_vendida * it.valor_unitario) AS faturamento
FROM categoria c
  JOIN evento e ON e.id_categoria = c.id
  JOIN sessao s ON s.id_evento = e.id
  JOIN ingresso i ON i.id_sessao = s.id
  JOIN item it ON it.id_ingresso = i.id
  JOIN pedido p ON p.id_item = it.id
  JOIN pagamento pg ON pg.id_pedido = p.id
WHERE pg.estado = 'aprovado'
GROUP BY c.id, c.nome 
ORDER BY faturamento DESC;

-- exercicio 10
SELECT
    e.titulo AS titulo_evento,
    s.data_evento,
    s.horario,
    (i.quantidade_vendida / i.quantidade_total) * 100.0 AS taxa_ocupacao
FROM sessao s
  JOIN evento e ON e.id = s.id_evento
  JOIN ingresso i ON i.id_sessao = s.id
WHERE i.quantidade_total > 0 
  AND (i.quantidade_vendida / i.quantidade_total) >= 0.8
ORDER BY taxa_ocupacao DESC;

-- exercicio 11

SELECT
    c.nome AS categoria,
    i.tipo,
    SUM(i.quantidade_vendida) AS total_vendido
FROM categoria c
  JOIN evento e ON e.id_categoria = c.id
  JOIN sessao s ON s.id_evento = e.id
  JOIN ingresso i ON i.id_sessao = s.id
WHERE s.estado IN ('aberta', 'esgotada')
GROUP BY c.id, c.nome, i.tipo ORDER BY c.nome ASC, total_vendido DESC;

-- exercicio 12
SELECT
    l.identificacao AS local_evento,
    SUM(i.quantidade_vendida * i.valor_unitario) AS faturamento
FROM sessao s
  JOIN evento e ON e.id = s.id_evento
  JOIN local_evento l ON l.id = e.id_local_evento
  JOIN ingresso i ON i.id_sessao = s.id
  JOIN item it ON it.id_ingresso = i.id
  JOIN pedido p ON p.id_item = it.id
  JOIN pagamento pg ON pg.id_pedido = p.id
WHERE pg.estado = 'aprovado'
AND s.data_evento BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 3 MONTH)
GROUP BY l.id, l.identificacao ORDER BY faturamento DESC;


-- exercicio 13
SELECT 
    e.titulo AS titulo_evento,
    s.id AS id_sessao,
    s.data_evento,
    s.horario,
    i.quantidade_vendida
FROM evento e
  JOIN sessao s ON s.id_evento = e.id
  JOIN ingresso i ON i.id_sessao = s.id
WHERE (s.id_evento, i.quantidade_vendida) IN (
    SELECT 
        s2.id_evento,
        MAX(i2.quantidade_vendida)
    FROM sessao s2
      JOIN ingresso i2 ON i2.id_sessao = s2.id
    GROUP BY s2.id_evento
)
ORDER BY e.titulo ASC;

-- exercicio 14
SELECT 
    c.nome AS categoria
FROM categoria c
  LEFT JOIN evento e ON e.id_categoria = c.id
  LEFT JOIN sessao s ON s.id_evento = e.id
  LEFT JOIN ingresso i ON i.id_sessao = s.id
  LEFT JOIN item it ON it.id_ingresso = i.id
  LEFT JOIN pedido p ON p.id_item = it.id AND p.estado = 'pago'
GROUP BY c.id, c.nome
HAVING COUNT(e.id) = 0 OR COUNT(p.id) = 0       
ORDER BY c.nome ASC;


-- exercicio 15 
WITH compras AS (
    SELECT 
        p.id_cliente,
        COUNT(*) AS total_compras
    FROM pedido p
      JOIN pagamento pg ON pg.id_pedido = p.id AND pg.estado = 'aprovado'
    WHERE pg.data_pagamento >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    GROUP BY p.id_cliente
    HAVING total_compras >= 3
),
checkins AS (
    SELECT 
        ch.id_cliente,
        COUNT(DISTINCT e.id_categoria) AS categorias_distintas
    FROM checkin ch
      JOIN sessao s ON s.id = ch.id_sessao
      JOIN evento e ON e.id = s.id_evento
    WHERE ch.estado = 'valido'
    GROUP BY ch.id_cliente
    HAVING categorias_distintas >= 2
)
SELECT 
    cl.id,
    cl.nome,
    cl.email
FROM cliente cl
  JOIN compras cp ON cp.id_cliente = cl.id
  JOIN checkins ck ON ck.id_cliente = cl.id
ORDER BY cl.nome ASC;

-- exercicio 16 
SELECT 
    p.id AS pedido,
    SUM(pg.valor) AS total_pago,
    SUM(it.valor_unitario) AS total_itens,
    (SUM(pg.valor) - SUM(it.valor_unitario)) AS diferenca
FROM pedido p
  JOIN pagamento pg ON pg.id_pedido = p.id AND pg.estado = 'aprovado'
  JOIN item it ON it.id = p.id_item
GROUP BY p.id
HAVING diferenca != 0
ORDER BY diferenca DESC;


