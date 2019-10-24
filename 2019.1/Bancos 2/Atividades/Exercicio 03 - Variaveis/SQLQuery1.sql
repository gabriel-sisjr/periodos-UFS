create database atividade_03

-- Declaracao de variaveis
declare @categoria_loja int
set @categoria_loja = 1

/*
create table loja(
	id int,
	nome varchar
)

alter table loja alter column nome varchar(30)

insert into loja values (1, 'Loja1')
*/
select * from loja where id = @categoria_loja