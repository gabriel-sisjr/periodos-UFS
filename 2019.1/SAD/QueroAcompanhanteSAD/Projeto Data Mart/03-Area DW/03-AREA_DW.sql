/**
 * UNIVERSIDADE FEDERAL DE SERGIPE
 * DEPARTAMENTO DE SISTEMAS DE INFORMAÇÃO - DSI
 * SISTEMAS DE APOIO A DECISÃO -SAD
 * PROJETAR AMBIENTE DE SUPORTE A DECISÃO BASEADO EM SISTEMA DE ACOMPANHANTES
 * ABRAÃO ALVES, IGOR BRUNO E GABRIEL SANTANA
 **/

USE QUEROACOMPANHANTE_SAD;
CREATE SCHEMA AMBIENTE_DIMENSIONAL;

-- -----------------------------------------------------
-- TABLE AMBIENTE_DIMENSIONAL.DIM_TEMPO
-- -----------------------------------------------------
CREATE TABLE AMBIENTE_DIMENSIONAL.DIM_TEMPO (
                                                id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
                                                nivel VARCHAR(3) NOT NULL,
                                                data DATE NULL,
                                                dia SMALLINT NULL,
                                                nomeDia VARCHAR(20) NULL,
                                                mes SMALLINT NULL,
                                                nomeMes VARCHAR(20) NULL,
                                                trimestre VARCHAR(45) NULL,
                                                nomeTrimestre VARCHAR(45) NULL,
                                                semestre VARCHAR(45) NULL,
                                                nomeSemestre VARCHAR(45) NULL,
                                                ano SMALLINT NOT NULL
)

-- -----------------------------------------------------
-- TABLE AMBIENTE_DIMENSIONAL.DIM_LOCALIDADE
-- -----------------------------------------------------
CREATE TABLE AMBIENTE_DIMENSIONAL.DIM_LOCALIDADE (
                                                     id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
                                                     codigo_localidade INT NOT NULL,
                                                     estado VARCHAR(45) NOT NULL,
                                                     cidade VARCHAR(45) NOT NULL,
                                                     rua VARCHAR(45) NOT NULL,
                                                     bairro VARCHAR(45) NOT NULL
)

-- -----------------------------------------------------
-- TABLE AMBIENTE_DIMENSIONAL.DIM_CLIENTE
-- -----------------------------------------------------
CREATE TABLE AMBIENTE_DIMENSIONAL. DIM_CLIENTE (
                                                   id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
                                                   codigo_cliente INT NOT NULL,
                                                   nome VARCHAR(45) NOT NULL,
                                                   cpf VARCHAR(11) NOT NULL,
                                                   telefone VARCHAR(13) NOT NULL,
                                                   genero VARCHAR(45) NOT NULL,
                                                   usuario VARCHAR(45) NOT NULL,
                                                   idade SMALLINT NOT NULL,
                                                   dataNascimento DATE NOT NULL
)

-- -----------------------------------------------------
-- TABLE AMBIENTE_DIMENSIONAL.DIM_OPORTUNIDADE
-- -----------------------------------------------------
CREATE TABLE AMBIENTE_DIMENSIONAL.DIM_OPORTUNIDADE (
                                                       id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
                                                       codigo_oportunidade INT NOT NULL,
                                                       titulo VARCHAR(50) NOT NULL,
                                                       descricao VARCHAR(300) NOT NULL,
                                                       status VARCHAR(45) NOT NULL CHECK (status IN ('ABERTA', 'OCUPADA', 'FECHADA')),
                                                       eh_publica SMALLINT NOT NULL CHECK(eh_publica IN (1,0)),
                                                       qtd_candidatos INT NOT NULL, -- adicionei esse campo aqui e retirei ele do fato
                                                       dt_inicio DATE NOT NULL,
                                                       dt_fim DATE NULL,
                                                       fl_corrente CHAR(3) NOT NULL CHECK(fl_corrente IN ('SIM','NAO'))
)


-- -----------------------------------------------------
-- TABLE AMBIENTE_DIMENSIONAL.DIM_ACOMPANHANTE
-- -----------------------------------------------------
CREATE TABLE AMBIENTE_DIMENSIONAL.DIM_ACOMPANHANTE (
                                                       id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
                                                       codigo_acompanhante INT NOT NULL,
                                                       nome VARCHAR(45) NOT NULL,
                                                       cpf VARCHAR(45) NOT NULL,
                                                       telefone VARCHAR(45) NOT NULL,
                                                       genero VARCHAR(45) NOT NULL,
                                                       usuario VARCHAR(45) NOT NULL,
                                                       idade INT NOT NULL,
                                                       dataNascimento DATE NOT NULL,
                                                       valorHora DECIMAL(10,0) NOT NULL
)

-- -----------------------------------------------------
-- TABLE AMBIENTE_DIMENSIONAL.DIM_SERVICO
-- -----------------------------------------------------
CREATE TABLE AMBIENTE_DIMENSIONAL.DIM_SERVICO (
                                                  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
                                                  codigo_servico INT NOT NULL,
                                                  status VARCHAR(45) NOT NULL CHECK (status IN('EM ANDAMENTO', 'CANCELADA', 'CONCLUIDA')),
                                                  dt_inicio DATE NOT NULL,
                                                  dt_fim DATE NULL,
                                                  fl_corrente CHAR(3) NOT NULL CHECK(fl_corrente IN ('SIM','NAO'))
)

-- -----------------------------------------------------
-- TABLE AMBIENTE_DIMENSIONAL.DIM_TRANSACAO
-- -----------------------------------------------------
CREATE TABLE AMBIENTE_DIMENSIONAL.DIM_TRANSACAO (
                                                    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
                                                    tipo_pagamento VARCHAR(50) CHECK(tipo_pagamento IN ('EM ESPECIE','CARTAO CREDITO/DEBITO','NAO REALIZADO'))
)
-- -----------------------------------------------------
-- TABLE AMBIENTE_DIMENSIONAL.DIM_FAIXA_ETARIA
-- -----------------------------------------------------
CREATE TABLE AMBIENTE_DIMENSIONAL.DIM_FAIXA_ETARIA (
                                                       id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
                                                       codigo_faixa_etaria INT NOT NULL,
                                                       descricao VARCHAR(45) NOT NULL,
                                                       idade_inicial SMALLINT NOT NULL,
                                                       idade_final SMALLINT NOT NULL
)

-- -----------------------------------------------------
-- TABLE AMBIENTE_DIMENSIONAL.DIM_TIPO_ACOMPANHAMENTO
-- -----------------------------------------------------
CREATE TABLE AMBIENTE_DIMENSIONAL.DIM_TIPO_ACOMPANHAMENTO (
                                                              id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
                                                              codigo_tipo_acompanhante INT NOT NULL,
                                                              tipo_acompanhamento VARCHAR(45) NOT NULL,
                                                              descricao VARCHAR(300) NOT NULL
)

-- -----------------------------------------------------
-- TABLE AMBIENTE_DIMENSIONAL.FATO_ACOMPANHAMENTO
-- -----------------------------------------------------
CREATE TABLE AMBIENTE_DIMENSIONAL.FATO_ACOMPANHAMENTO (
                                                          id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
                                                          id_tempo INT NOT NULL,
                                                          id_cliente INT NOT NULL,
                                                          id_acompanhante INT NOT NULL,
                                                          id_localidade INT NOT NULL,
                                                          id_oportunidade INT NULL,
                                                          id_servico INT NOT NULL,
                                                          id_transacao INT NOT NULL,
                                                          id_faixa_etaria_cliente INT NOT NULL,
                                                          id_faixa_etaria_acompanhante INT NOT NULL,
                                                          id_tipo_acompanhamento INT NOT NULL,
                                                          qtd INT NOT NULL,
                                                          valor DECIMAL(10,0) NOT NULL,
                                                          CONSTRAINT FK_DIM_TEMPO FOREIGN KEY(id_tempo) REFERENCES AMBIENTE_DIMENSIONAL.DIM_TEMPO(id),
                                                          CONSTRAINT FK_DIM_LOCALIDADE FOREIGN KEY(id_localidade) REFERENCES AMBIENTE_DIMENSIONAL.DIM_LOCALIDADE(id),
                                                          CONSTRAINT FK_DIM_CLIENTE FOREIGN KEY(id_cliente) REFERENCES AMBIENTE_DIMENSIONAL.DIM_CLIENTE(id),
                                                          CONSTRAINT FK_DIM_OPORTUNIDADE FOREIGN KEY (id_oportunidade) REFERENCES AMBIENTE_DIMENSIONAL.DIM_OPORTUNIDADE(id),
                                                          CONSTRAINT FK_DIM_ACOMPANHANTE FOREIGN KEY(id_acompanhante) REFERENCES AMBIENTE_DIMENSIONAL.DIM_ACOMPANHANTE(id),
                                                          CONSTRAINT FK_DIM_SERVICO FOREIGN KEY(id_servico) REFERENCES AMBIENTE_DIMENSIONAL.DIM_SERVICO(id),
                                                          CONSTRAINT Fk_DIM_TRANSACAO FOREIGN KEY(id_transacao) REFERENCES AMBIENTE_DIMENSIONAL.DIM_TRANSACAO(id),
                                                          CONSTRAINT Fk_DIM_FAIXA_ETARIA_CLIENTE FOREIGN KEY (id_faixa_etaria_cliente) REFERENCES AMBIENTE_DIMENSIONAL.DIM_FAIXA_ETARIA(id),
                                                          CONSTRAINT Fk_DIM_FAIXA_ETARIA_ACOMPANHANTE FOREIGN KEY (id_faixa_etaria_acompanhante) REFERENCES AMBIENTE_DIMENSIONAL.DIM_FAIXA_ETARIA(id),
                                                          CONSTRAINT Fk_DIM_TIPO_ACOMPANHAMENTO FOREIGN KEY (id_tipo_acompanhamento) REFERENCES AMBIENTE_DIMENSIONAL.DIM_TIPO_ACOMPANHAMENTO(id)
)

-- -----------------------------------------------------
-- AGREGADO ACOMPANHAMENTO CONCLUIDOS
-- -----------------------------------------------------
CREATE TABLE AMBIENTE_DIMENSIONAL.FATO_ACOMPANHAMENTO_CONCLUIDO(
                                                                   id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
                                                                   id_tempo INT NOT NULL,
                                                                   id_oportunidade INT NOT NULL,
                                                                   qtd INT NOT NULL,
                                                                   valor NUMERIC(10,2) NOT NULL
)