create database atividade_05;

use atividade_05;

create procedure calcularImposto(@renda decimal(10,2), @imposto decimal(10,2) output)
as
	declare @i decimal(10,2);
	if(@renda < 1372.81)
		set @imposto = 0.0;

	if(@renda > 1372.81 and @renda < 2743.25)
		set @imposto = ((@renda - 1372.81)/15);

	if(@renda > 2743.25)
		set @imposto = ((@renda - 2743.25)/27.5) + ((@renda - 2743.25) - 1372.81)/15;