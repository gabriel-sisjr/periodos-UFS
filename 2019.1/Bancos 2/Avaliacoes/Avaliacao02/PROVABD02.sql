CREATE DATABASE PROVA_2
USE PROVA_2

create table tb_surfista (
   id_surfista int not null,
   nome_surfista varchar(100) not null
)

insert into tb_surfista values(10, 'GABRIEL MEDINA')
insert into tb_surfista values(17, 'JULIAN WILSON')
insert into tb_surfista values(12, 'KELLY SLATER')
insert into tb_surfista values(15, 'FILIPE TOLEDO')

create table tb_bateria (
   id_bateria int not null primary key identity(1,1),
   id_surfista_1 int not null,
   id_surfista_2 int not null
)

insert into tb_bateria values (10,17)

create table tb_ondas_bateria (
   id_onda int not null primary key identity(1,1),
   id_bateria int not null,
   id_surfista int not null,
   nota_1  numeric(10,2) check (nota_1 >=0 and nota_1 <=10),
   nota_2  numeric(10,2) check (nota_2 >=0 and nota_2 <=10),
   nota_3  numeric(10,2) check (nota_3 >=0 and nota_3 <=10),
   nota_4  numeric(10,2) check (nota_4 >=0 and nota_4 <=10)
)

create table tb_ondas_placar (
   id_bateria int not null,
   id_surfista int not null,
   nm_surfista varchar(100) not null,
   nota_final_onda1 numeric(10,2) null default(0.0),
   nota_final_onda2 numeric(10,2) null default(0.0),
   nota_total numeric(10,2) null default (0.0),
   primary key (id_bateria, id_surfista)
)


/* ========= QUESTAO 1 ========= */
CREATE TRIGGER TG_BATERIA
ON TB_BATERIA
AFTER INSERT
AS
BEGIN
	DECLARE @ID_BATERIA INT, @ID_SURFISTA_1 INT, @ID_SURFISTA_2 INT, @NOME_SURFISTA1 VARCHAR(100), @NOME_SURFISTA2 VARCHAR(100)

	DECLARE CURSOR_BATERIA CURSOR
	FOR
	SELECT ID_BATERIA, ID_SURFISTA_1, ID_SURFISTA_2 FROM INSERTED

	OPEN CURSOR_BATERIA
	FETCH CURSOR_BATERIA INTO @ID_BATERIA, @ID_SURFISTA_1, @ID_SURFISTA_2

	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		SET @NOME_SURFISTA1 = (SELECT NOME_SURFISTA FROM TB_SURFISTA WHERE ID_SURFISTA = @ID_SURFISTA_1)
		SET @NOME_SURFISTA2 = (SELECT NOME_SURFISTA FROM TB_SURFISTA WHERE ID_SURFISTA = @ID_SURFISTA_2)

		INSERT INTO TB_ONDAS_PLACAR (ID_BATERIA, ID_SURFISTA, NM_SURFISTA)
			VALUES (@ID_BATERIA, @ID_SURFISTA_1, @NOME_SURFISTA1),
				   (@ID_BATERIA, @ID_SURFISTA_2, @NOME_SURFISTA2)

		FETCH CURSOR_BATERIA INTO @ID_BATERIA, @ID_SURFISTA_1, @ID_SURFISTA_2
	END

	CLOSE CURSOR_BATERIA
	DEALLOCATE CURSOR_BATERIA
END

insert into tb_bateria values (10,17)
SELECT * FROM TB_BATERIA
SELECT * FROM TB_ONDAS_PLACAR

/* ========= QUESTAO 2 ========= */
CREATE TRIGGER TG_BATERIA_DELETE
ON TB_BATERIA
AFTER DELETE
AS
BEGIN
	DECLARE @ID_BATERIA INT

	DECLARE CURSOR_DETE CURSOR
	FOR
	SELECT ID_BATERIA FROM DELETED

	OPEN CURSOR_DETE
	FETCH CURSOR_DETE INTO @ID_BATERIA

	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		IF(NOT EXISTS(SELECT 1 AS VALIDO FROM TB_BATERIA WHERE ID_BATERIA = @ID_BATERIA) AND EXISTS(SELECT 1 AS VALIDO FROM DELETED WHERE ID_BATERIA = @ID_BATERIA))
			DELETE FROM TB_ONDAS_PLACAR WHERE ID_BATERIA = @ID_BATERIA
	
		FETCH CURSOR_DETE INTO @ID_BATERIA
	END

	CLOSE CURSOR_DETE
	DEALLOCATE CURSOR_DETE
END

DELETE FROM TB_BATERIA WHERE ID_BATERIA = 1
insert into tb_bateria values (10,17)
SELECT * FROM TB_BATERIA
SELECT * FROM TB_ONDAS_PLACAR

/* ========= QUESTAO 3 ========= */
CREATE TRIGGER TG_ONDAS
ON TB_ONDAS_BATERIA
AFTER INSERT
AS
BEGIN
	DECLARE @ID_BATERIA INT, @ID_SURFISTA INT, @NOTA1 NUMERIC(10,2), @NOTA2 NUMERIC(10,2), @NOTA3 NUMERIC(10,2), @NOTA4 NUMERIC(10,2),
			@NOTA_FIM1 NUMERIC(10,2), @NOTA_FIM2 NUMERIC(10,2), @MEDIA NUMERIC(10,2)

	DECLARE CURSOR_NOTA CURSOR
	FOR
	SELECT ID_BATERIA, ID_SURFISTA, NOTA_1, NOTA_2, NOTA_3, NOTA_4 FROM INSERTED

	OPEN CURSOR_NOTA
	FETCH CURSOR_NOTA INTO @ID_BATERIA, @ID_SURFISTA, @NOTA1, @NOTA2, @NOTA3, @NOTA4

	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		SET @NOTA_FIM1 = (SELECT NOTA_FINAL_ONDA1 FROM TB_ONDAS_PLACAR WHERE ID_BATERIA = @ID_BATERIA AND ID_SURFISTA = @ID_SURFISTA)
		SET @NOTA_FIM2 = (SELECT NOTA_FINAL_ONDA2 FROM TB_ONDAS_PLACAR WHERE ID_BATERIA = @ID_BATERIA AND ID_SURFISTA = @ID_SURFISTA)

		SET @MEDIA = (@NOTA1 + @NOTA2 + @NOTA3 + @NOTA4)/4

		IF(@NOTA_FIM1 <= @NOTA_FIM2)
			IF(@NOTA_FIM1 < @MEDIA)
			BEGIN
				UPDATE TB_ONDAS_PLACAR
					SET NOTA_FINAL_ONDA1 = @MEDIA,
						NOTA_TOTAL = NOTA_FINAL_ONDA2 + @MEDIA
					WHERE ID_BATERIA = @ID_BATERIA AND ID_SURFISTA = @ID_SURFISTA


				FETCH CURSOR_NOTA INTO @ID_BATERIA, @ID_SURFISTA, @NOTA1, @NOTA2, @NOTA3, @NOTA4
				CONTINUE
			END

		IF(@NOTA_FIM2 <= @NOTA_FIM1)
			IF(@NOTA_FIM2 < @MEDIA)
			BEGIN
				UPDATE TB_ONDAS_PLACAR
					SET NOTA_FINAL_ONDA2 = @MEDIA,
						NOTA_TOTAL = NOTA_FINAL_ONDA1 + @MEDIA
					WHERE ID_BATERIA = @ID_BATERIA AND ID_SURFISTA = @ID_SURFISTA


				FETCH CURSOR_NOTA INTO @ID_BATERIA, @ID_SURFISTA, @NOTA1, @NOTA2, @NOTA3, @NOTA4
				CONTINUE
			END

		FETCH CURSOR_NOTA INTO @ID_BATERIA, @ID_SURFISTA, @NOTA1, @NOTA2, @NOTA3, @NOTA4
	END
	
	CLOSE CURSOR_NOTA
	DEALLOCATE CURSOR_NOTA
END

-- Primeira onda Gabriel
insert into tb_ondas_bateria values (1, 10, 9, 9.5, 9.3, 9.2)
SELECT * FROM TB_ONDAS_PLACAR

-- Segunda onda Gabriel
insert into tb_ondas_bateria values (1, 10, 5, 5, 5, 5)
SELECT * FROM TB_ONDAS_PLACAR

-- Terceira onda Gabriel
insert into tb_ondas_bateria values (1, 10, 10, 10, 10, 10)
SELECT * FROM TB_ONDAS_PLACAR

-- Primeira Onda Julian
insert into tb_ondas_bateria values (1, 17, 8.7, 8, 8.3, 8.1)
SELECT * FROM TB_ONDAS_PLACAR

-- Segunda Onda Julian
insert into tb_ondas_bateria values (1, 17, 9.4, 9, 9.1, 9.2)
SELECT * FROM TB_ONDAS_PLACAR