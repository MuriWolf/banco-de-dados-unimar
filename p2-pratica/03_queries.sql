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
JOIN pagamento AS pg
    ON pg.id_pedido = p.id
WHERE pg.data_pagamento >= '2024-01-01' and pg.data_pagamento < '2024-02-01'
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

