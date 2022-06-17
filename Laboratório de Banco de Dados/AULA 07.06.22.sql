--Alan Teixeira Barboza
use labbd

--1) Crie as tabelas Use constraint PK, FK, unique em nomeC, null em areaR, check em num_quartoR (<3).

CREATE TABLE Serviço
 (codigoS int NOT NULL,
 nomes varchar(25) NOT NULL,
 constraint co1 primary key (codigoS)
 );

 CREATE TABLE Cliente
 (cpfC int NOT NULL,
 foneC int NOT NULL,
 nomeC varchar(25) NOT NULL,
 constraint cp1 primary key (cpfC),
 constraint no1 unique (nomeC)
 );

 CREATE TABLE Residencia
 (codigoR int NOT NULL,
 num_quartosR int,
 enderecoR varchar (10),
 areaR int NULL,
 cpfC int NOT NULL,
 constraint cd1 primary key (codigoR),
 constraint cp2 foreign key (cpfC) references Cliente(cpfC),
 constraint num1 check(num_quartosR < 3)
 );

 CREATE TABLE Solicitar
 (codigoS int NOT NULL,
 codigoR int NOT NULL,
 data_solicitacao datetime,
 constraint p1 primary key (data_solicitacao),
 constraint f1 foreign key (codigoS) references Serviço(codigoS),
 constraint f2 foreign key (codigoR) references Residencia(codigoR)
 );

 --2) Inserir 3 linhas nas tabelas.
insert into Serviço values (1,'lavar a louça') ;
insert into Serviço values (2,'varrer o chão') ;
insert into Serviço values (3,'tirar o pó') ;
insert into Serviço values (4,'regar as plantas') ;

insert into Cliente values (123456,40028922,'Angelo') ;
insert into Cliente values (678912,45012788,'Juan') ;
insert into Cliente values (654321,47828332,'Larissa') ;

insert into Residencia values (1,0,'Rua x',45,123456) ;
insert into Residencia values (2,2,'Rua y',55,678912) ;
insert into Residencia values (3,1,'Rua z',76,654321) ;

insert into Solicitar values (1, 1,'2005-01-01') ;
insert into Solicitar values (2, 2,'2007-02-02') ;
insert into Solicitar values (3, 3,'2021-03-03') ;

--3) Listar o nome dos serviços, em maiúsculo, cujo nome inicia com a letra v.
select UPPER(nomes)
from Serviço 
where SUBSTRING(nomes,1,1) = 'v'

--4) Listar as residências com número de quartos entre 2 e 4.
select *
from Residencia
where num_quartosR Between 2 and 4

--5) Exibir o codigoS e o codigoR, e o ano da data da solicitação que pertença à lista (2005,2007,2020)
select *
from Solicitar
where year(data_solicitacao) in ('2005','2007','2020')

--6) Quais as residências do cliente de nome Angelo?
select c1.nomeC, r1.enderecoR
from Residencia r1 inner join Cliente c1
on c1.cpfC = r1.cpfC
where c1.nomeC = 'Angelo'

--7) Quais serviços nunca foram solicitados?
select t1.nomes, t2.codigoS
from Serviço t1 left join Solicitar t2
on t1.codigoS = t2.codigoS
where t2.codigoS is NULL;

--8) Liste o nome do cliente, o endereço de sua residência, e o nome do serviço
select c.nomeC, r.enderecoR, s.nomes
from Cliente c
inner join Residencia r
on c.cpfC = r.cpfC
inner join Solicitar z
on r.codigoR = z.codigoR
inner join Serviço s
on z.codigoS = s.codigoS;

--9) Quantas solicitações de serviço a residência de codigo X solicitou?

select count(*)
from serviço s1 inner join solicitar s2
on s1.codigoS = s2.codigoS
inner join Residencia s3
on s2.codigoS = s3.codigoR
where s3.codigoR = 2


--10) Liste a quantidade de residências atendidas, por nome de serviço, mas somente quantidades maiores que 1.
Select s.nomes, count(s.nomes)
From Solicitar z
Inner join Serviço S
On z.codigos = s.codigos
Group by s.nomes;

--11) Qual a quantidade de quartos que um cliente possui ao somar todos os quartos das residências que possui?
Select c.nomeC, sum(r.num_quartosR) from Cliente c
Inner join Residencia r
On c.cpfC = r.cpfC
Group by c.nomeC;

-- 12) Exclua um serviço de codigo X
Delete from Serviço Where codigoS=4;

-- 13) Atualize o nome de um cliente
Update Cliente SET nomeC = ‘Flavio’ where nomeC=’Angelo’;

-- 14) Crie duas tabelas cliente100 e residencia100: semelhante, em estrutura e dados, às tabelas cliente e residência. Inclua as chaves primárias e estrangeiras nessas tabelas. Inclua uma linha em cliente100. Exclua os clientes que não possuem residências.

ALTER TABLE cliente100 ADD CONSTRAINT pf_cpfc100 PRIMARY KEY(cpfC);
ALTER TABLE residencia100 ADD CONSTRAINT pk_codigoR100 PRIMARY KEY(codigoR);
ALTER TABLE residencia100 ADD CONSTRAINT fk_cpf100 FOREIGN KEY(cpfC) REFERENCES Cliente(cpfC);
ALTER TABLE residencia100 ADD CONSTRAINT num_quartoR100 CHECK(num_quartoR < 3);

SELECT * FROM Cliente100;
SELECT * FROM Residencia100;

--Excluir clientes sem residência
DELETE Cliente100
FROM Cliente100
LEFT OUTER JOIN Residencia100
ON Cliente100.cpfC = Residencia100.cpfC
WHERE residencia100.codigoR IS NULL;
--15) Exclua a tabela residência. Crie a tabela residencia200 semelhante à tabela residência, com respectivas chaves. Inclua a opção cascade, para exclusão, em residencia200. Inclua uma linha em residencia200. Exclua um cliente referenciado em residencia200. O que ocorre?
CREATE TABLE Residencia200(
(codigoR int NOT NULL,
 num_quartosR int,
 enderecoR varchar (10),
 areaR int NULL,
 cpfC int NOT NULL,
 constraint cd1 primary key (codigoR),
 constraint num1 check(num_quartosR < 3)
 constraint cp2 foreign key (cpfC) references Cliente(cpfC) ON DELETE CASCADE
);
IINSERT INTO Residencia200 VALUES (10,1,’RUA A’,50,111111),(20,2,’Avenida B’,65,200200), (30,2,’PRACA C’, 75, 300300);

SELECT * INTO Cliente200 FROM Cliente;
ALTER TABLE cliente200 ADD CONSTRAINT pf_cpfC200 PRIMARY KEY(cpfC);

-- O comando DELETE conflita com a restrição do REFERENCE ‘’fk_codigoresidencia’’
DELETE FROM Residencia WHERE cpfC = 111111; 

-- DELETADO
DELETE FROM Residencia WHERE cpfC = 111111; 

