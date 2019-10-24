CREATE TABLE TB_VENDAS (
   CD_VENDA INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   DT_VENDA DATETIME NOT NULL,
   CD_PRODUTO INT NOT NULL,
   QUANTIDADE INT NOT NULL,
   VALOR NUMERIC(10,2) NOT NULL
)
