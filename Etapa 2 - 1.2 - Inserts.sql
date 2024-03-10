/**

Script para inserção de dados nas tabelas no banco de dados SQL

Heitor
2024-03-07

**/

-- ===============
-- 1.2
-- ===
INSERT INTO FILME (id_filme, nm_filme, dt_criacao, is_ativo, id_genero)
VALUES
    (1, 'Avatar', '2009-12-18', 1, 1),  
    (2, 'O Poderoso Chefão', '1972-03-24', 1, 3),  
    (3, 'Um Sonho de Liberdade', '1994-09-23', 1, 3),  
    (4, 'Pulp Fiction: Tempo de Violência', '1994-10-14', 1, 3),  
    (5, 'O Cavaleiro das Trevas', '2008-07-18', 1, 1),  
    (6, 'Forrest Gump: O Contador de Histórias', '1994-07-06', 1, 3),  
    (7, 'A Origem', '2010-07-16', 1, 1),  
    (8, 'Matrix', '1999-03-31', 1, 1),  
    (9, 'Clube da Luta', '1999-10-15', 1, 3),  
    (10, 'O Senhor dos Anéis: A Sociedade do Anel', '2001-12-19', 1, 1), 
    (11, 'O Senhor dos Anéis: O Retorno do Rei', '2003-12-17', 1, 1), 
    (12, 'O Senhor dos Anéis: As Duas Torres', '2002-12-18', 1, 1), 
    (13, 'O Poderoso Chefão 2', '1974-12-20', 1, 3), 
    (14, 'O Silêncio dos Inocentes', '1991-02-14', 1, 3),  
    (15, 'Gladiador', '2000-05-05', 1, 1), 
    (16, 'Interestelar', '2014-11-07', 1, 1), 
    (17, 'Os Infiltrados', '2006-10-06', 1, 3),  
    (18, 'O Resgate do Soldado Ryan', '1998-07-24', 1, 1),  
    (19, 'À Espera de Um Milagre', '1999-12-10', 1, 3),  
    (20, 'O Grande Truque', '2006-10-20', 1, 3);  


-- ===============
-- 1.3
-- ===
INSERT INTO USUARIO (id_usuario, nm_usuario, ds_email, nu_cpf, is_ativo)
VALUES
    (1, 'João da Silva', 'silva.joao@gmail.com', '111.111.111-11', 1),
    (2, 'Maria Souza', 'souza.maria@outlook.com', '222.222.222-22', 1),
    (3, 'Pedro Oliveira', 'oliveira.pedro@yahoo.com', '333.333.333-33', 1),
    (4, 'Ana Santos', 'santos.ana@icloud.com', '444.444.444-44', 1),
    (5, 'Lucas Costa', 'costa.lucas@hotmail.com', '555.555.555-55', 1);


-- ===============
-- 1.4
-- ===
INSERT INTO GENERO (id_genero, ds_genero, dt_criacao, is_ativo)
VALUES
    (1, 'Ação', '1972-03-24', 1),
    (2, 'Aventura', '2001-12-19', 1),
    (3, 'Drama', '1972-03-24', 1),
    (4, 'Crime', '1972-03-24', 1),
    (5, 'Sci-Fi', '1999-03-31', 1);  


-- ===============
-- 1.5
-- ===
/**

Para um exemplo fictício, o loop abaixo irá gerar os registros de acordo com a solicitação de uma forma prática.
Em ambientes reais, a partir da lista para inserção dos registros, seria necessário recuperar o id do campo correspondente para então inserir na tabela corretamente

**/

DECLARE @i INT = 1;

WHILE @i <= 20
BEGIN
    DECLARE @id_usuario INT = CAST(RAND() * 5 + 1 AS INT);
    DECLARE @id_filme INT = CAST(RAND() * 20 + 1 AS INT);

    INSERT INTO LOCACAO (id_locacao, id_filmelocacao, dt_locacao)
    VALUES (@i, @id_filme, DATEADD(DAY, -@i, GETDATE()));

    SET @i = @i + 1;
END;
