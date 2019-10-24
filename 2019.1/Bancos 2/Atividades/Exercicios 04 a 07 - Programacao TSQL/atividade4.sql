create database atividade_04;

use atividade_04;

-- ITEM 01
create table cliente(
	matricula int not null primary key identity(1,1),
	nome varchar(40),
	telefone varchar(10)
);

-- ITEM 02
create procedure spIncluiCliente (@matricula int, @nome varchar(40), @telefone varchar(10))
as
	insert into cliente (matricula, nome, telefone) values (@matricula, @nome, @telefone);

-- ITEM 03
create procedure spRemoveCliente (@matricula int, @msg bit output)
as
	delete from cliente where matricula = @matricula;

	-- Declarando já atribuindo
	declare @erro int = @@ERROR, @rowCount int = @@ROWCOUNT;

	if(@erro = 0 and @rowCount = 1)
		set @msg = 1;
	else
		set @msg = 0;

-- ITEM 04
-- Procedimento 1
alter procedure spIncluiCliente (@matricula int, @nome varchar(40), @telefone varchar(10), @msg bit output)
as
	insert into cliente (matricula, nome, telefone) values (@matricula, @nome, @telefone);
	
	-- Serve pra checar se houve algum erro na execução da instrução anterior. Retorna 0 caso tudo OK, !=0 caso erro.
	if(@@error = 0)
		set @msg = 1;
	else
		set @msg = 0;

-- Procedimento 2
alter procedure spRemoveCliente (@matricula int, @msg bit output)
as
	delete from cliente where matricula = @matricula;
	if(@@error = 0)
		set @msg = 1;
	else
		set @msg = 0;

-- ITEM 05
create procedure spAlteraCliente (@matricula int, @nome varchar(40), @telefone varchar(10))
as
	update cliente set nome = @nome, telefone = @telefone where matricula = @matricula;

-- ITEM 06
alter procedure spAlteraCliente (@matricula int, @nome varchar(40), @telefone varchar(10), @msg varchar(40) output)
as
	update cliente set nome = ISNULL(@nome, nome), telefone = ISNULL(@telefone, telefone) where matricula = @matricula;
/*
	declare @erro int, @rowCount int;
	if(@nome = null)
		begin
			update cliente set telefone = @telefone where matricula = @matricula;
			
			 select @erro = @@error, @rowCount = @@ROWCOUNT;

			if(@erro = 0 and @rowCount = 1)
				set @msg = 'Alterado sem modificar o nome!';
		end
	else if(@telefone = null)
			begin
				update cliente set nome = @nome where matricula = @matricula;
			
				select @erro = @@error, @rowCount = @@ROWCOUNT;

				if(@erro = 0 and @rowCount = 1)
					set @msg = 'Alterado sem modificar o telefone!';
			end
	else
		begin
			update cliente set nome = @nome, telefone = @telefone where matricula = @matricula;
			
			select @erro = @@error, @rowCount = @@ROWCOUNT;

			if(@erro = 0 and @rowCount = 1)
				set @msg = 'Registro alterado com sucesso!';
		end
*/