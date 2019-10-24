/** 
 * UNIVERSIDADE FEDERAL DE SERGIPE 
 * DEPARTAMENTO DE SISTEMAS DE INFORMA??O - DSI
 * SISTEMAS DE APOIO A DECIS?O -SAD
 * PROJETAR AMBIENTE DE SUPORTE A DECIS?O BASEADO EM SISTEMA DE ACOMPANHANTES
 * ABRAÃO ALVES, IGOR BRUNO E GABRIEL SANTANA
 * 25/07/2019
 **/
 USE QUEROACOMPANHANTE_SAD;
 CREATE SCHEMA AMBIENTE_OLAP;
								--- ------------------------------------------- ---
								-- CRIANDO TABELAS AUXILIARES DA AREA DE STAGING --
								--- ------------------------------------------- ---

CREATE TABLE AMBIENTE_OLAP.TB_AUX_CLIENTE(
	data_carga DATETIME NOT NULL,
	codigo INT NOT NULL,
	nome VARCHAR(45) NULL,
	cpf VARCHAR(11) NULL,
	telefone VARCHAR(13) NULL,
	genero VARCHAR(45) NULL,
	usuario VARCHAR(45) NULL,
	data_nascimento DATE NULL,
	idade INT NULL
) 

CREATE TABLE AMBIENTE_OLAP.TB_AUX_OPORTUNIDADE(	
	data_carga DATETIME NOT NULL,
	codigo INT NOT NULL,
	data_solicitacao DATETIME NULL,
	titulo VARCHAR(50) NULL,
	descricao VARCHAR(300) NULL,
	status VARCHAR(45) NULL CHECK (status IN ('ABERTA', 'OCUPADA', 'FECHADA')),
	eh_publica SMALLINT NOT NULL CHECK (eh_publica IN (1,0)),
	id_tipo_acompanhamento INT NULL,
	qtd_candidatos INT NULL, -- novo campo
)

CREATE TABLE AMBIENTE_OLAP.TB_AUX_LOCALIDADE(
	data_carga DATETIME NOT NULL,
	codigo INT NOT NULL,
	id_servico INT NULL, 
	estado CHAR(2) NULL,
	cidade VARCHAR(45) NULL,
	rua VARCHAR(45) NULL,
	bairro VARCHAR(45) NULL
)

CREATE TABLE AMBIENTE_OLAP.TB_AUX_ACOMPANHANTE(
	data_carga DATETIME NOT NULL,
	codigo INT NOT NULL,
	nome VARCHAR(45) NULL,
	cpf VARCHAR(11) NULL,
	telefone VARCHAR(13) NULL,
	genero VARCHAR(45) NULL,
	usuario VARCHAR(45) NULL,
	data_nascimento DATE NULL,
	idade INT NULL,
	valor_hora NUMERIC(10,2) NULL
)

CREATE TABLE AMBIENTE_OLAP.TB_AUX_SERVICO(
	data_carga DATETIME NOT NULL,
	codigo INT NOT NULL,
	id_cliente INT NULL,
	id_acompanhante INT NULL,
	id_oportunidade INT NULL,
	valor_total NUMERIC(10,2), -- novo campo
	status VARCHAR(45) NULL CHECK(status IN('EM ANDAMENTO', 'CANCELADA', 'CONCLUIDA'))
)

CREATE TABLE AMBIENTE_OLAP.TB_AUX_TIPO_ACOMPANHAMENTO(
	data_carga DATETIME NOT NULL,
	codigo INT NOT NULL,
	descricao VARCHAR(300) NULL,
	tipo_acompanhamento VARCHAR(100) NULL
)


CREATE TABLE AMBIENTE_OLAP.TB_AUX_FATO_ACOMPANHAMENTO(
	data_carga DATETIME NOT NULL,
	id_tempo INT  NULL,
	id_cliente INT NULL,
	id_acompanhante INT NULL,
	id_localidade INT NULL,
	id_oportunidade INT  NULL,
	id_servico INT NULL,
	id_transacao INT NULL,
	id_faixa_etaria_cliente INT NULL,
	id_faixa_etaria_acompanhante INT  NULL,
	id_tipo_acompanhamento INT NULL,
	qtd INT NULL,
	valor NUMERIC(10,2) NULL,
)


/*--------------------------- CRIANDO TABELAS DE VIOLACAO DA AREA DE STAGING ---------------------------*/

CREATE TABLE AMBIENTE_OLAP.TB_VIO_CLIENTE(
	id INT IDENTITY(1,1) NOT NULL,
	data_carga DATETIME NOT NULL,
	codigo INT NOT NULL,
	nome VARCHAR(45) NULL,
	cpf VARCHAR(11) NULL,
	telefone VARCHAR(13) NULL,
	genero VARCHAR(45) NULL,
	usuario VARCHAR(45) NULL,
	data_nascimento DATE NULL,
	idade INT NULL,
	data_violacao DATETIME NOT NULL,
	violacao VARCHAR(100) NOT NULL
	PRIMARY KEY(id)
)

CREATE TABLE AMBIENTE_OLAP.TB_VIO_OPORTUNIDADE(
	id INT IDENTITY(1,1) NOT NULL,
	data_carga DATETIME NOT NULL,
	codigo INT NOT NULL,
	data_solicitacao DATETIME NULL,
	titulo VARCHAR(50) NULL,
	descricao VARCHAR(300) NULL,
	status VARCHAR(45) NULL CHECK (status IN ('ABERTA', 'OCUPADA', 'FECHADA')),
	eh_publica SMALLINT NOT NULL CHECK (eh_publica IN (1,0)),
	id_tipo_acompanhamento INT NULL,
	qtd_candidatos INT NULL, -- novo campo
	data_violacao DATETIME NOT NULL,
	violacao VARCHAR(100) NOT NULL
	PRIMARY KEY(id)
)

CREATE TABLE AMBIENTE_OLAP.TB_VIO_LOCALIDADE(
	id INT IDENTITY(1,1) NOT NULL,
	data_carga DATETIME NOT NULL,
	codigo INT NOT NULL,
	id_usuario INT NULL, 
	estado CHAR(2) NULL,
	cidade VARCHAR(45) NULL,
	rua VARCHAR(100) NULL,
	bairro VARCHAR(100) NULL,
	data_violacao DATETIME NOT NULL,
	violacao VARCHAR(100) NOT NULL
	PRIMARY KEY(id)
)

CREATE TABLE AMBIENTE_OLAP.TB_VIO_ACOMPANHANTE(
	id INT IDENTITY(1,1) NOT NULL,
	data_carga DATETIME NOT NULL,
	codigo INT NOT NULL,
	nome VARCHAR(45) NULL,
	cpf VARCHAR(11) NULL,
	telefone VARCHAR(13) NULL,
	genero VARCHAR(45) NULL,
	usuario VARCHAR(45) NULL,
	data_nascimento DATE NULL,
	idade INT NULL,
	valor_hora NUMERIC(10,2) NULL,
	data_violacao DATETIME NOT NULL,
	violacao VARCHAR(100) NOT NULL
	PRIMARY KEY(id)
)

CREATE TABLE AMBIENTE_OLAP.TB_VIO_SERVICO(
	id INT IDENTITY(1,1) NOT NULL,
	data_carga DATETIME NOT NULL,
	codigo INT NOT NULL,
	id_cliente INT NULL,
	id_acompanhante INT NULL,
	id_oportunidade INT NOT NULL,
	valor_total NUMERIC(10,2), -- novo campo
	status VARCHAR(45) NULL CHECK(status IN('EM ANDAMENTO', 'CANCELADA', 'CONCLUIDA')),
	data_violacao DATETIME NOT NULL,
	violacao VARCHAR(100) NOT NULL
	PRIMARY KEY(id)
)

CREATE TABLE AMBIENTE_OLAP.TB_VIO_TIPO_ACOMPANHAMENTO(
	id INT IDENTITY(1,1) NOT NULL,
	data_carga DATETIME NOT NULL,
	codigo INT  NOT NULL,
	descricao VARCHAR(300) NULL,
	tipo_acompanhamento VARCHAR(45) NULL,
	data_violacao DATETIME NOT NULL,
	violacao VARCHAR(100) NOT NULL
	PRIMARY KEY(id)
)


CREATE TABLE AMBIENTE_OLAP.TB_VIO_FATO_ACOMPANHAMENTO(
	id INT IDENTITY(1,1) NOT NULL,
	data_carga DATETIME NOT NULL,
	id_tempo INT  NULL,
	id_cliente INT NULL,
	id_acompanhante INT NULL,
	id_localidade INT NULL,
	id_oportunidade INT  NULL,
	id_servico INT NULL,
	id_transacao INT NULL,
	id_faixa_etaria_cliente INT NULL,
	id_faixa_etaria_acompanhante INT  NULL,
	id_tipo_acompanhamento INT NULL,
	qtd INT NULL,
	valor NUMERIC(10,2) NULL,
	data_violacao DATETIME NOT NULL,
	violacao VARCHAR(100) NOT NULL
	PRIMARY KEY(id)

)