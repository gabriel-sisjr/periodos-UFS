USE funcoes;


-- =====================
-- =      QUESTAO1     =
-- =====================

CREATE FUNCTION SF_DataCompleta(@data DATE) RETURNS VARCHAR(200)
AS
BEGIN
	DECLARE @dataString varchar(200), @dia INT, @ano INT;

	SET @dia = DATEPART(dd, @data);
	SET @ano = DATEPART(yy, @data);

	SET @dataString = CONCAT(STR(@dia) + '/' + DATENAME(mm, @data) + '/', TRIM(STR(@ano)));

	RETURN @dataString;
END

-- DROP FUNCTION
DROP FUNCTION SF_DataCompleta;

-- Setando a linguagem para pt-BR
SET LANGUAGE Brazilian;

-- PRINTANDO
PRINT dbo.SF_DataCompleta(GETDATE());

-- ====================================================
-- =====================
-- =      QUESTAO2     =
-- =====================

CREATE FUNCTION SF_LPAD(@String varchar(8000), @Tamanho int, @Caracter char(1))
RETURNS VARCHAR(8000)
AS
BEGIN
	DECLARE @aux varchar(8000);

	IF(@Tamanho >= LEN(@String))
	BEGIN
		WHILE(@Tamanho <> 0)
		BEGIN
			SET @aux = CONCAT(@Caracter, @aux);
			SET @Tamanho = @Tamanho - 1;
		END

		-- Concatenando
		SET @String = CONCAT(@aux, @String);
	END

	IF(@Tamanho < LEN(@String))
		SET @String = LEFT(@String, @Tamanho);

	RETURN @String;
END

DROP FUNCTION SF_LPAD;

PRINT dbo.SF_LPAD('Clovinho', 2, 'x')