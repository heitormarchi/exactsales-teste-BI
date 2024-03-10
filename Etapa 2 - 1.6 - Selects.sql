/**

Selects solicitados na prova.

Heitor
2024-03-07

**/

-- ===============
-- 1.6
-- ===
SELECT 
    f.nm_filme 		AS Nome_Filme, 
    g.ds_genero 	AS Nome_Genero, 
    l.dt_locacao 	AS Data_Locacao, 
    u.nm_usuario 	AS Nome_Usuario, 
    u.ds_email 		AS Email_Usuario

FROM LOCACAO 		l
JOIN FILMELOCACAO 	fl 	ON l.id_filmelocacao = fl.id_filmelocacao
JOIN FILME 			f	ON fl.id_filme = f.id_filme
JOIN GENERO 		g	ON f.id_genero = g.id_genero
JOIN USUARIO 		u	ON l.id_usuario = u.id_usuario

WHERE 
    YEAR(LOCACAO.dt_locacao) = YEAR(GETDATE()) 
	AND MONTH(LOCACAO.dt_locacao) = MONTH(GETDATE());

-- ===============
-- 1.7
-- ===
SELECT 
    u.nm_usuario 	AS Nome_Usuario, 
    u.nu_cpf 		AS CPF

FROM LOCACAO		l
JOIN USUARIO 	u 	ON l.id_usuario = u.id_usuario

WHERE u.is_ativo = 0;


-- ===============
-- 1.8
-- ===
SELECT DISTINCT
    f.id_filme AS ID,
    f.nm_filme AS Nome

FROM LOCACAO 		l
JOIN FILMELOCACAO 	fl 	ON l.id_filmelocacao = fl.id_filmelocacao
JOIN FILME 			f	ON fl.id_filme = f.id_filme
JOIN USUARIO 		u	ON l.id_usuario = u.id_usuario

WHERE u.ds_email LIKE '%a%';


-- ===============
-- 1.9
-- ===
SELECT 
    f.nm_filme 	AS Nome_Filme, 
    COUNT(1) 	AS "Quantidade de aluguéis"
	
FROM LOCACAO		l
JOIN FILMELOCACAO 	fl	ON l.id_filmelocacao = fl.id_filmelocacao
JOIN FILME 			f 	ON fl.id_filme = f.id_filme

GROUP BY f.nm_filme
ORDER BY COUNT(1) DESC;