CREATE DATABASE funcoes;

USE funcoes;

-- FUNCOES
CREATE FUNCTION SF_CALC_IMPOSTO(@renda decimal(10,2)) RETURNS decimal(10,2)
AS
BEGIN
	-- Variavel retornavel
	DECLARE @imposto DECIMAL(10,2);

	if(@renda < 1372.81)
		set @imposto = 0.0;

	if(@renda > 1372.81 and @renda < 2743.25)
		set @imposto = ((@renda - 1372.81)/15);

	if(@renda > 2743.25)
		set @imposto = ((@renda - 2743.25)/27.5) + ((@renda - 2743.25) - 1372.81)/15;

	return @imposto;
END

DECLARE @renda decimal(10,2);
DECLARE @resultado decimal(10,2);

SET @renda = 10000;
EXEC @resultado = SF_CALC_IMPOSTO @renda;
PRINT @resultado;