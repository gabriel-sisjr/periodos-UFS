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


-- Primeira onda Gabriel
insert into tb_ondas_bateria values (1, 10, 9, 9.5, 9.3, 9.2)

-- Segunda onda Gabriel
insert into tb_ondas_bateria values (1, 10, 5, 5, 5, 5)

-- Terceira onda Gabriel
insert into tb_ondas_bateria values (1, 10, 10, 10, 10, 10)

-- Primeira Onda Julian
insert into tb_ondas_bateria values (1, 17, 8.7, 8, 8.3, 8.1)

-- Segunda Onda Julian
insert into tb_ondas_bateria values (1, 17, 9.4, 9, 9.1, 9.2)


create table tb_ondas_placar (
   id_bateria int not null,
   id_surfista int not null,
   nm_surfista varchar(100) not null,
   nota_final_onda1 numeric(10,2) null default(0.0),
   nota_final_onda2 numeric(10,2) null default(0.0),
   nota_total numeric(10,2) null default (0.0),
   primary key (id_bateria, id_surfista)
)

 
