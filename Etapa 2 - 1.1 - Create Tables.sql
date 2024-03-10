/**

Script para criação das tabelas no banco de dados SQL

Além do SQL, há outras formas de fazê-lo a depender do cenário.
Em um cenátio de cargas batch onde a cada carga as tabelas carregam e dropam, optaria por uma versão em Python, para conseguir orquestrá-lo no pipeline.

Optei por alterar a nomenclatura proposta para os campos, utilizando um padrão que julgo mais escalável e de melhor entendimento, baseado no documento de normalização do DataSUS (fonte: https://ced.saude.gov.br/arquivo/download?path=%2Fuploads%2F&file=daaed-mad-objetosbd-v2-3-20180815140520.pdf)

Heitor
2024-03-07

**/

CREATE TABLE GENERO (
    id_genero INT PRIMARY KEY,
    ds_genero VARCHAR(100) NOT NULL,
    dt_criacao DATETIME NOT NULL,
    is_ativo TINYINT NOT NULL
);

CREATE TABLE FILME (
    id_filme INT PRIMARY KEY,
    nm_filme VARCHAR(200) NOT NULL,
    dt_criacao DATETIME NOT NULL,
    is_ativo TINYINT NOT NULL,
    id_genero INT NOT NULL,
    FOREIGN KEY (id_genero) REFERENCES GENERO(id_genero)
);

CREATE TABLE FILMELOCACAO (
    id_filmelocacao INT PRIMARY KEY,
    id_filme INT NOT NULL,
    FOREIGN KEY (id_filme) REFERENCES FILME(id_filme)
);

CREATE TABLE LOCACAO (
    id_locacao INT PRIMARY KEY,
    id_filmelocacao INT NOT NULL,
    dt_locacao DATETIME NOT NULL,
    FOREIGN KEY (id_filmelocacao) REFERENCES FILMELOCACAO(id_filmelocacao)
);

CREATE TABLE USUARIO (
    id_usuario INT PRIMARY KEY,
    nm_usuario VARCHAR(200) NOT NULL,
    ds_email VARCHAR(100) NOT NULL,
    nu_cpf VARCHAR(14) NOT NULL,
    is_ativo TINYINT NOT NULL
);