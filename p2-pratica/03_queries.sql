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
