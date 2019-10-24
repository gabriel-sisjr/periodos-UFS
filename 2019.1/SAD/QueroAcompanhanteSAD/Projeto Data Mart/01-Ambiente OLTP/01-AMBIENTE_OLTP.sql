/**
 * UNIVERSIDADE FEDERAL DE SERGIPE
 * DEPARTAMENTO DE SISTEMAS DE INFORMAÇÃO - DSI
 * SISTEMAS DE APOIO A DECISÃO -SAD
 * PROJETAR AMBIENTE DE SUPORTE A DECISÃO BASEADO EM SISTEMA DE ACOMPANHANTES
 * ABRAÃO ALVES, IGOR BRUNO E GABRIEL SANTANA
 **/

CREATE DATABASE QueroAcompanhanteSAD;
USE QUEROACOMPANHANTE_SAD;

CREATE SCHEMA AMBIENTE_OLTP;

												--- -----------------------------------------
												--		CRIANDO TABELAS DO BANCO		   --	
												--- -----------------------------------------

CREATE TABLE AMBIENTE_OLTP.Usuario(
	idUsuario INT IDENTITY(1,1) NOT NULL ,
	nome VARCHAR(45) NOT NULL,
	telefone VARCHAR(13) NOT NULL,
	genero VARCHAR(45) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	dataNascimento DATE NOT NULL,
	email VARCHAR(45) NOT NULL,
	usuario VARCHAR(45) NOT NULL,
	senha VARCHAR(15) NOT NULL,
	descricao VARCHAR(500) NOT NULL,
	data_atualizacao DATETIME NOT NULL, 
	PRIMARY KEY (idUsuario)
)

CREATE TABLE AMBIENTE_OLTP.Endereco( 
	idEndereco INT IDENTITY(1,1) NOT NULL ,
	estado CHAR(2) NOT NULL,
	cidade VARCHAR(45) NOT NULL,
	rua VARCHAR(45) NOT NULL,
	bairro VARCHAR(45) NOT NULL,
	numero INT NULL,
	idUsuario INT NOT NULL,
	data_atualizacao DATETIME NOT NULL,
	PRIMARY KEY (idEndereco),
	FOREIGN KEY (idUsuario) REFERENCES AMBIENTE_OLTP.Usuario (idUsuario)
)

CREATE TABLE AMBIENTE_OLTP.Acompanhante(
   idAcompanhante INT NOT NULL,
   valorHora NUMERIC(10,2) NOT NULL ,
   credencialContaDigital VARCHAR(45) NULL DEFAULT NULL,
   data_atualizacao DATETIME NOT NULL,
   PRIMARY KEY (idAcompanhante),
   FOREIGN KEY (idAcompanhante) REFERENCES AMBIENTE_OLTP.Usuario (idUsuario)   
)

CREATE TABLE AMBIENTE_OLTP.TipoAcompanhamento(
	idTipoAcompanhamento INT IDENTITY(1,1) NOT NULL,
	tipoAcompanhamento VARCHAR(100) NOT NULL,
	descricao VARCHAR(300) NULL,
	data_atualizacao DATETIME NOT NULL,
	PRIMARY KEY(idTipoAcompanhamento)
)
CREATE TABLE AMBIENTE_OLTP.Oportunidade (
   idOportunidade INT IDENTITY(1,1) NOT NULL,
   data_solicitacao DATETIME NOT NULL,
   titulo VARCHAR(50) NOT NULL,
   descricao VARCHAR(300) NULL DEFAULT NULL,
   idTipoAcompanhamento INT NOT NULL,
   idCliente INT NOT NULL,
   idAcompanhante INT NULL, 
   idAcompanhnatePreferido INT NULL,
   status VARCHAR(45) NULL CHECK(status IN ('ABERTA','OCUPADA','FECHADA')),
   EhPublica SMALLINT NOT NULL,
   data_atualizacao DATETIME NOT NULL,
   PRIMARY KEY(idOportunidade),
   FOREIGN KEY (idTipoAcompanhamento) REFERENCES AMBIENTE_OLTP.TipoAcompanhamento(idTipoAcompanhamento),
   FOREIGN KEY (idCliente) REFERENCES AMBIENTE_OLTP.Usuario(idUsuario),
)

CREATE TABLE AMBIENTE_OLTP.Servico (
   idServico INT IDENTITY(1,1) NOT NULL,
   idOportunidade INT NOT NULL,
   idCliente INT NOT NULL,
   idAcompanhante INT NOT NULL,	
   status VARCHAR(45) NOT NULL CHECK(status IN ('EM ANDAMENTO', 'CANCELADA', 'CONCLUIDA')),
   data_atualizacao DATETIME NOT NULL,
   PRIMARY KEY(idServico),
   FOREIGN KEY (idOportunidade) REFERENCES AMBIENTE_OLTP.Oportunidade(idOportunidade)

)

CREATE TABLE AMBIENTE_OLTP.Mensagem (
   idMensagem INT IDENTITY(1,1) NOT NULL,
   mensagem VARCHAR(300) NULL DEFAULT NULL,
   dataEHora DATETIME NULL DEFAULT NULL,
   idRemetente INT NOT NULL,
   idDestinatario INT NOT NULL,
   idServico INT NOT NULL,
   data_atualizacao DATETIME NOT NULL,
   PRIMARY KEY(idMensagem),
   FOREIGN KEY (idServico) REFERENCES AMBIENTE_OLTP.Servico(idServico)
)

CREATE TABLE AMBIENTE_OLTP.DetalhesEncontro(
   idDetalhesEncontro INT IDENTITY(1,1) NOT NULL,	
   idServico INT NOT NULL,
   dataServico DATETIME NULL DEFAULT NULL,
   horaInicio TIME NULL DEFAULT NULL,
   horaFim TIME NULL DEFAULT NULL,
   estado char(2) NULL DEFAULT NULL,
   cidade VARCHAR(45) NULL DEFAULT NULL,
   bairro VARCHAR(100) NULL DEFAULT NULL,   
   rua VARCHAR(100) NULL DEFAULT NULL,
   nLocal INT NULL DEFAULT NULL,
   referencia VARCHAR(100) NULL DEFAULT NULL,
   valor NUMERIC(10,2) NULL DEFAULT NULL,
   data_atualizacao DATETIME NOT NULL,
   PRIMARY KEY (idDetalhesEncontro),
   FOREIGN KEY (idServico) REFERENCES AMBIENTE_OLTP.Servico(idServico)
)

CREATE TABLE AMBIENTE_OLTP.Candidatura(
   idCandidatura INT IDENTITY(1,1) NOT NULL,
   idAcompanhante INT NOT NULL,
   idOportunidade INT NOT NULL,
   data_atualizacao DATETIME NOT NULL,
   PRIMARY KEY (idCandidatura),
   FOREIGN KEY(idAcompanhante) REFERENCES AMBIENTE_OLTP.Acompanhante(idAcompanhante),
   FOREIGN KEY(idOportunidade) REFERENCES AMBIENTE_OLTP.Oportunidade(idOportunidade)
)

CREATE TABLE AMBIENTE_OLTP.Transacao(
	idTransacao INT IDENTITY(1,1) NOT NULL,
	idServico INT NOT NULL,
	dataTransacao DATETIME NOT NULL,
	tipoPagamento VARCHAR(50) CHECK(tipoPagamento IN (('EM ESPECIE'),('CARTAO CREDITO/DEBITO'))),
	data_atualizacao DATETIME NOT NULL,
	PRIMARY KEY (idTransacao),
	FOREIGN KEY (idServico) REFERENCES AMBIENTE_OLTP.Servico(idServico)
)


									--- ----------------------------------------------------------------------
									--				PROCEDIMENTOS ARMAZENADOS PARA POPULAR O BANCO			--
									--- ----------------------------------------------------------------------


--- -------------------------------------
-- POPULANDO O BANCO
--- -------------------------------------
EXEC AMBIENTE_OLTP.SP_POVOA_AMBIENTE_OLTP


--- -------------------------------------
-- INSERINDO CLIENTES E ACOMPANHANTES  
--- -------------------------------------
CREATE PROCEDURE AMBIENTE_OLTP.SP_INSERE_USUARIOS 
AS
	BEGIN
		INSERT INTO AMBIENTE_OLTP.Usuario (nome,telefone,genero,cpf,dataNascimento,email,usuario,senha,descricao,data_atualizacao)
		VALUES('IGOR BRUNO','75998719582','MASCULINO','07852892590', CAST('19980524' AS DATETIME),'igorb22@live.com','igorb22','0123456','',GETDATE()),
			  ('ABRA�O PEREIRA ALVES','79994854123','MASCULINO','07852134569',CAST('19980901' AS DATETIME),'abraao@gmail.com','abralvs','0123456','',GETDATE()),
			  ('JOSIELY DE OLIVEIRA','79998716573','FEMININO','07195693290',CAST('19990106' AS DATETIME),'josy@gmail.com','josi99','josygat','SOU ESTUDANTE DE FISICA E PRESTO ACOMPANHANMENTO ESCOLAR PARA ALUNOS AT� 9� ANO E ACOMPANHAMENTO INFANTIL',GETDATE()),
			  ('MARIA APARECIDA','79989527369','FEMININO','06932416590',CAST('19781231' AS DATETIME),'cia@gmail.com','cidaribs','5544asd','OL�, ME CHAMO APARECIDA E FA�O ACOMPANHAMENTO INFANTIL e DOM�STICO, ME CONTRATE, POSSO CUIDAR DOS SEUS FILHOS',GETDATE()),
			  ('MARCIA SANTANA','79551166661','FEMININO','07863245980',CAST('19850801' AS DATETIME),'marciasantana@outlook.com','marciasantana','marcinha123','SOU ACADEMICA DE ENFERMAGEM E FA�O ACOMPANHAMENO M�DICO POR UM PRE�O JUSTO!',GETDATE()),
			  ('GILMAR RIBEIRO','75998287294','MASCULINO','04763214789',CAST('19810506' AS DATETIME),'gilmar@hotmail.com','gilmarsans','511654S65D','EM BUSCA DE ACOMPANHANTES DOM�STICAS E PARA CUIDAR DOS MEUS FILHOS',GETDATE())

		INSERT INTO AMBIENTE_OLTP.Endereco (estado,cidade,rua,bairro,numero,idUsuario,data_atualizacao)
		VALUES ('BA','PARIPIRANGA','ZONA RURAL','POV. RASO',00,1,GETDATE()),
			   ('SE','ITABAIANA','RUA EUCLIDES PAES MENDON�A','CENTRO',600,2,GETDATE()),
			   ('SE','ITABAIANA','RUA CAPITAO JOS� FERREIRA','CENTRO',232,3,GETDATE()),
			   ('SE','ITABAIANA','AV. BOANERGES PINHEIRO','CENTRO',144,4,GETDATE()),
			   ('SE','LAGARTO','RUA GET�LIO VARGAS','CENTRO',186,5,GETDATE()),
			   ('SE','ARACAJU','RUA LARANJEIRAS','BAIRO JARDINS',98,6,GETDATE())


		INSERT INTO AMBIENTE_OLTP.Acompanhante (idAcompanhante,valorHora,credencialContaDigital,data_atualizacao)
		VALUES(3,20.00,'HD541DA-1',GETDATE()), 
			  (4,50.00,'00145HJ-X',GETDATE()),
			  (5,120.00,'00012A-0',GETDATE())
	END

GO
--- --------------------------------------------------------------------------------------
-- INSERINDO OPORTUNIDADES, CANDIDATURAS, SOLICITACOES DE SERVICO E TIPOS DE SERVICO
--- --------------------------------------------------------------------------------------

CREATE PROCEDURE AMBIENTE_OLTP.SP_INSERE_SOLICITACOES_SERVICO
AS 
	BEGIN

		INSERT INTO AMBIENTE_OLTP.TipoAcompanhamento (tipoAcompanhamento,descricao,data_atualizacao)
		VALUES('ACOMPANHAMENTO M�DICO','ESTE ACOMPANHANTE OFERECE SERVICOS DE ACOMPANHAMENTO EM ATIVIDADES E CUIDADOS M�DICOS.',GETDATE()),
			  ('ACOMPANHAMENTO INFANTIL','ESTE ACOMPANHANTE OFERECE SERVI�OS DE BAB� PARA CRIAN�AS E OUTROS CUIDADOS ESPECIAS',GETDATE()),
			  ('ACOMPANHAMENTO DOM�STICO','ESTE ACOMPANHANTE OFERECE SERVI�OS DE LIMPEZA,COZINHEIRO E OUTROS CUDIADOS DOM�STICOS',GETDATE()),
			  ('ACOMPANHAMENTO PARA IDOSOS','ESTE ACOMPANHANTE OFERECE SERVI�OS DE BAB� PARA IDOSOS E OUTROS CUIDADOS ESPECIAS',GETDATE()),
			  ('ACOMPANHAMENTO ESCOLAR','ESTE ACOMPANHANTE OFERECE SERVI�OS  DE AJUDA E REFOR�O ESCOLAR',GETDATE()),
			  ('ACOMPANHAMENTO PARA PESSOAS COM NECESSIDADES ESPECIAIS','ESTE ACOMPANHANTE OFERECE SERVI�OS DE ACOMPANHAMENTO PARA PESSOAS COM NECESSIDADES ESPECIAIS TAIS COMO DEFICI�NCIA F�SICA',GETDATE())


		INSERT INTO AMBIENTE_OLTP.Oportunidade (data_solicitacao,titulo,descricao,idTipoAcompanhamento,idCliente,idAcompanhante,idAcompanhnatePreferido,status,EhPublica,data_atualizacao)
		VALUES(GETDATE(), 'VAGA PARA ACOMPANHANTE MEDICO','PROCURO UMA PESSOA PARA FAZER UM ACOMPANHAMENTO M�DICO COMIGO NO PR�XIMO FINAL DE SEMANA 21-22/07, HORARIOS A COMBINAR',1,6,NULL,5,'ABERTA',0,GETDATE()),
			  (GETDATE(), 'VAGA PARA BABA','PROCURO UMA PESSOA PARA FAZER ACOMPANHAMENTO INFANTIL PARA OS MEUS FILHOS NO PROXIMO FINAL DE SEMANA 21-22/07, HORARIOS A COMBINAR',2,6,NULL,NULL,'ABERTA',1,GETDATE()),
			  (GETDATE(), 'VAGA PARA PROFESSORA DE BANCA','PROCURO UMA PESSOA PARA FAZER UM ACOMPANHAMENTO ESCOLAR COMIGO',5,1,NULL,NULL,'ABERTA',1,GETDATE())
		
		INSERT INTO AMBIENTE_OLTP.Candidatura (idAcompanhante,idOportunidade,data_atualizacao)
		VALUES(4,2,GETDATE()),
			  (3,2,GETDATE()),
			  (3,3,GETDATE())
		
		UPDATE AMBIENTE_OLTP.Oportunidade SET idAcompanhante = 5, status = 'OCUPADA',data_atualizacao = GETDATE() where idOportunidade = 1
		UPDATE AMBIENTE_OLTP.Oportunidade SET idAcompanhante = 4, status = 'OCUPADA',data_atualizacao = GETDATE() where idOportunidade = 2
		UPDATE AMBIENTE_OLTP.Oportunidade SET idAcompanhante = 3, status = 'OCUPADA',data_atualizacao = GETDATE() where idOportunidade = 3

		INSERT INTO AMBIENTE_OLTP.Servico (idOportunidade,idCliente,idAcompanhante,status,data_atualizacao)
		VALUES(1,6,5,'EM ANDAMENTO',GETDATE()),
			  (2,6,4,'EM ANDAMENTO',GETDATE()),
			  (3,1,3,'EM ANDAMENTO',GETDATE())
	END

GO
--- ---------------------------------------------------------------------------
-- INSERINDO A NEGOCIA��O PARA O SERVI�O, DIALOGOS ENCONTROS E TRANSACOES
--- ---------------------------------------------------------------------------
CREATE PROCEDURE AMBIENTE_OLTP.SP_INSERIR_NEGOCIACAO
AS 
	BEGIN
	
		INSERT INTO AMBIENTE_OLTP.Mensagem (mensagem,dataEHora,idRemetente,idDestinatario,idServico,data_atualizacao)
		VALUES ('Ol� bom dia, preciso de uma pessoa para realizar um acompanhamento dom�stico com a minha av�',GETDATE(),6,5,1,GETDATE()),
			   ('qual o dia ?',GETDATE(),5,6,1,GETDATE()),
			   ('dia 25/07, voc� pode ?',GETDATE(),6,5,1,GETDATE()),
			   ('posso sim, o dia todo ?',GETDATE(),5,6,1,GETDATE()),
			   ('n�o, s� das 8 at� as 12 ',GETDATE(),6,5,1,GETDATE()),
			   ('pronto, pode confirmar o encontro',GETDATE(),5,6,1,GETDATE()),
			   ('Certo.',GETDATE(),6,5,1,GETDATE())

		-- Detalhes Primeiro Encontro
		INSERT INTO AMBIENTE_OLTP.DetalhesEncontro (idServico,dataServico,horaInicio,horaFim,estado,cidade,bairro,rua,nLocal,referencia,valor,data_atualizacao)
		VALUES(1,'20190725','08:00:00','12:00:00','SE','ITABAIANA','CENTRO','AV. BOANERGES PINHEIRO',144,'',580.00,GETDATE())


		/*-----------------------------------------------------------------------------------------------------------------------------------*/	
		
		INSERT INTO AMBIENTE_OLTP.Mensagem (mensagem,dataEHora,idRemetente,idDestinatario,idServico,data_atualizacao)
		VALUES('Oi',GETDATE(),6,4,2,GETDATE()),
		      ('Ol�',GETDATE(),4,6,2,GETDATE()),
			  ('Gostaria de marcar um horario pra cuidar do meu filho no final de semana, voce tem disponibilidade?',GETDATE(),6,4,2,GETDATE()),
			  ('tenho sim, quais s�o os hor�rios ?',GETDATE(),4,6,2,GETDATE()),
			  ('sabado, das 09 as 15 horas ',GETDATE(),6,4,2,GETDATE()),
			  ('pronto, pode agendar o acompanhamento ',GETDATE(),4,6,2,GETDATE()),
			  ('certo, agendado!.',GETDATE(),6,4,2,GETDATE())
		
		-- DETALHES SEGUNDO ENCONTRO
		INSERT INTO AMBIENTE_OLTP.DetalhesEncontro (idServico,dataServico,horaInicio,horaFim,estado,cidade,bairro,rua,nLocal,referencia,valor,data_atualizacao)
		VALUES(2,'20190725','09:00:00','15:00:00','SE','ITABAIANA','CENTRO','RUA CAPITAO JOS� FERREIRA',232,'',300.00,GETDATE())
		
		
		/*-----------------------------------------------------------------------------------------------------------------------------------*/


		INSERT INTO AMBIENTE_OLTP.Mensagem (mensagem,dataEHora,idRemetente,idDestinatario,idServico,data_atualizacao)
		VALUES ('ol�, voce poderia me ajudar com refor�o esoclar en fisica ?',GETDATE(),1,4,3,GETDATE()),
			   ('posso sim, mo�o',GETDATE(),4,1,3,GETDATE()),
			   ('quinta feira a tarde dia 22/08 voce tem disponibilidade',GETDATE(),1,4,3,GETDATE()),
			   ('tenho sim',GETDATE(),4,1,3,GETDATE()),	
			   ('marcado ent�o, vou agendar aqui',GETDATE(),1,4,3,GETDATE()),
			   ('certo, at� l�',GETDATE(),4,1,3,GETDATE())
		

		INSERT INTO AMBIENTE_OLTP.DetalhesEncontro (idServico,dataServico,horaInicio,horaFim,estado,cidade,bairro,rua,nLocal,referencia,valor,data_atualizacao)
		VALUES(3,'20190822','14:00:00','18:00:00','SE','ITABAIANA','CENTRO','PERCILIO ANDRADE',507,'',80.00,GETDATE())
		

		/*-----------------------------------------------------------------------------------------------------------------------------------*/

		/*Servi�o cancelado*/
		INSERT INTO AMBIENTE_OLTP.Mensagem (mensagem,dataEHora,idRemetente,idDestinatario,idServico,data_atualizacao)
		VALUES('Ol�, tenho uma m� noticia, terei que cancelar o acompanhamento por motivo de fr�a maior',GETDATE(),4,6,2,GETDATE()),
			  ('S�rio isso ?',GETDATE(),6,4,2,GETDATE()),
			  ('Sim, Infelizmente n�o vai dar',GETDATE(),4,6,2,GETDATE()),
			  ('tudo bem ent�o',GETDATE(),6,4,2,GETDATE())
			  
		UPDATE AMBIENTE_OLTP.Servico SET status = 'CANCELADA', data_atualizacao = GETDATE() WHERE idServico = 2;

		
		/*-----------------------------------------------------------------------------------------------------------------------------------*/
		INSERT INTO AMBIENTE_OLTP.Transacao (idServico,dataTransacao,tipoPagamento,data_atualizacao)
		VALUES(1,'20190725','CARTAO CREDITO/DEBITO',GETDATE()),
			  (3,'20190822','EM ESPECIE',GETDATE())


		/*finalizando encontros*/
		UPDATE AMBIENTE_OLTP.Servico SET status = 'CONCLUIDA', data_atualizacao = GETDATE() WHERE idServico = 1;
		UPDATE AMBIENTE_OLTP.Servico SET status = 'CONCLUIDA', data_atualizacao = GETDATE() WHERE idServico = 3;
	
	END

GO

--- ---------------------------------------------------------------------------
-- EXECUTANDO PROCEDIMENTOS PARA POPULAR O BANCO
--- ---------------------------------------------------------------------------
CREATE PROCEDURE AMBIENTE_OLTP.SP_POVOA_AMBIENTE_OLTP 
AS
BEGIN
	EXEC AMBIENTE_OLTP.SP_INSERE_USUARIOS
	EXEC AMBIENTE_OLTP.SP_INSERE_SOLICITACOES_SERVICO
	EXEC AMBIENTE_OLTP.SP_INSERIR_NEGOCIACAO
END