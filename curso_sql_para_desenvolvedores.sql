-- CREATE DATABASE DesenvolvedorIO;
-- DROP DATABASE DesenvolvedorIO;
-- ALTER DATABASE DesenvolvedorIO SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
-- DROP DATABASE DesenvolvedorIO;

-- CREATE TABLE aluno
-- (
--     id int PRIMARY KEY IDENTITY,
--     nome VARCHAR(80) NOT NULL,
--     cpf CHAR(11) NOT NULL,
--     data_nascimento DATE,
--     ativo bit DEFAULT 1
-- );


-- INSERT INTO aluno(nome, cpf, data_nascimento, ativo) values ('Rafael', '0000000001', getdate(), 0)

-- INSERT INTO aluno (nome, cpf, data_nascimento, ativo) VALUES
--     ('Eduardo', '00000000002', GETDATE(), 0),
--     ('Bruno', '00000000003', GETDATE(), 0);


-- select * from  aluno

-- select nome, cpf from aluno

-- update aluno set data_nascimento = getdate(), ativo = 1

-- delete from aluno

-- truncate table aluno

-- delete top(1) from aluno

-- delete top(10) percent from aluno

-- drop table aluno

-- USE DesenvolvedorIO;

-- CREATE TABLE alunos
-- (
--     id int PRIMARY KEY IDENTITY,
--     nome VARCHAR(80) NOT NULL,
--     cpf CHAR(11) NOT NULL,
--     cidade VARCHAR(60) NOT NULL,
--     estado CHAR(2) NOT NULL,
--     data_nascimento DATE,
--     ativo BIT DEFAULT 1
-- )

-- CREATE TABLE categorias
-- (
--     id INT PRIMARY KEY IDENTITY,
--     descricao VARCHAR(80) NOT NULL,
--     cadastrado_em DATETIME DEFAULT GETDATE()
-- )

-- CREATE TABLE cursos
-- (
--     id INT PRIMARY KEY IDENTITY,
--     categoria_id INT NOT NULL,
--     descricao VARCHAR(80) NOT NULL,
--     total_horas INT NOT NULL,
--     valor DECIMAL(12, 2) NOT NULL DEFAULT 0,
--     cadastrado_em DATETIME DEFAULT GETDATE(),
--     ativo BIT DEFAULT 1,
--     CONSTRAINT fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES categorias (id)
-- )

-- CREATE TABLE alunos_cursos
-- (
--     aluno_id INT NOT NULL,
--     curso_id INT NOT NULL,
--     cadastrado_em DATETIME DEFAULT GETDATE(),
--     CONSTRAINT pk_alunos_cursos PRIMARY KEY (aluno_id, curso_id),
--     CONSTRAINT fk_aluno_id FOREIGN KEY (aluno_id) REFERENCES alunos(id),
--     CONSTRAINT fk_curso_id FOREIGN KEY (curso_id) REFERENCES cursos(id)
-- )

-- INSERT INTO alunos(nome, cpf, cidade, estado, data_nascimento) VALUES 
--     ('Rafael',  '00000000001', 'Aracaju', 'SE', '2000-01-01'),
--     ('Eduardo', '00000000002', 'São Paulo', 'SP', '2000-02-02'),
--     ('Bruno', '00000000003', 'São Paulo', 'SP', '2000-03-03'),
--     ('Tiago', '00000000004', 'Rio de Janeiro', 'RJ', '2000-04-04'),
--     ('Heloysa', '00000000005', 'Aracaju', 'SE', '2000-05-05');


-- INSERT INTO categorias(descricao) VALUES('Acesso a dados'),('Seguranca'), ('WEB')


-- INSERT INTO cursos(descricao, categoria_id, total_horas, valor) VALUES
--     ('EF Core'                         ,1, 17, 300),
--     ('SQL Server'                      ,1,  5, 200), 
--     ('ASP.NET Core Enterprise'         ,3,  5, 200),
--     ('Fundamentos de IdentityServer4'  ,2,  5, 200);


-- INSERT INTO alunos_cursos(aluno_id,curso_id) VALUES
--     (1, 1),
--     (1, 2),
--     (2, 3),
--     (3, 1),
--     (4, 4),
--     (5, 1),
--     (5, 2),
--     (5, 3);

-- Top/Fetch
-- select top 4 * from alunos order by id;
-- select top 10 percent * from alunos order by id;
-- select * from alunos order by id
-- offset 2 rows
-- fetch first 2 rows only

-- Conhecendo as funções
-- select left(descricao, 4), descricao from categorias
-- select right(descricao, 4), descricao from categorias
-- select substring(descricao, 2, 5), descricao from categorias
-- select 'RENATO ' + ' FRANCISCO' + NULL
-- select concat('RAFAEL ', 'ALMEIDA ', 'SANTOS')
-- select concat(descricao, ' teste') from categorias
-- select isnull(null, 'default')
-- select isnull(descricao, 'sem descricao') from categorias
-- select coalesce(null, null, null, 'primeiro', 'segundo')
-- select 2 * coalesce(null, 1)
-- select iif(1 > 0, 'maior que zero', 'menor que zero')
-- select iif(-1 > 0, 'maior que zero', 'menor que zero')
-- select iif(len(descricao) > 5, 'maior que 5', 'menor que 5'), descricao from categorias
-- select getdate()
-- select cast(getdate() as date)
-- select cast(getdate() as time)

-- Criando umam Stored Procedure
-- create procedure PesquisarCategoriaPorId(@id int)
-- as BEGIN
--     select * from categorias where id = @id
-- end

-- exec PesquisarCategoriaPorId 1

-- create procedure PersistirDadosEmCategorias(@descricao varchar(255))
-- as
-- begin
--     insert into categorias(descricao, cadastrado_em) values(@descricao, getdate())
--     return
-- end

-- exec PersistirDadosEmCategorias 'Categoria Procedure'
-- exec PersistirDadosEmCategorias null
-- select * from categorias

-- Criando uma View
-- create view vwCursos
-- as
-- select c.descricao, ca.descricao categoria from cursos c
-- inner join categorias ca
-- on c.categoria_id = ca.id

-- select * from vwCursos where descricao = 'EF Core'

-- Criando sequências
-- create sequence MinhaSequencia
-- AS INT
-- START WITH 6
-- INCREMENT BY 1
-- MINVALUE 6
-- MAXVALUE 1000
-- NO CYCLE

-- select next value for MinhaSequencia

-- create table TabelaTeste
-- (
--     id int default next value for MinhaSequencia,
--     descricao varchar(20)
-- )

-- insert into TabelaTeste(descricao) values('teste 02')
-- select * from TabelaTeste

-- Criando um campo novo
alter table categorias add teste varchar(100) default 'teste'
select * from categorias




