--Alan Teixeira Barboza
use labbd

--1) Crie as tabelas Use constraint PK, FK, unique em nomeC, null em areaR, check em num_quartoR (<3).

CREATE TABLE Servi�o
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
 constraint f1 foreign key (codigoS) references Servi�o(codigoS),
 constraint f2 foreign key (codigoR) references Residencia(codigoR)
 );

 --2) Inserir 3 linhas nas tabelas.
insert into Servi�o values (1,'lavar a lou�a') ;
insert into Servi�o values (2,'varrer o ch�o') ;
insert into Servi�o values (3,'tirar o p�') ;
insert into Servi�o values (4,'regar as plantas') ;

insert into Cliente values (123456,40028922,'Angelo') ;
insert into Cliente values (678912,45012788,'Juan') ;
insert into Cliente values (654321,47828332,'Larissa') ;

insert into Residencia values (1,0,'Rua x',45,123456) ;
insert into Residencia values (2,2,'Rua y',55,678912) ;
insert into Residencia values (3,1,'Rua z',76,654321) ;

insert into Solicitar values (1, 1,'2005-01-01') ;
insert into Solicitar values (2, 2,'2007-02-02') ;
insert into Solicitar values (3, 3,'2021-03-03') ;

--3) Listar o nome dos servi�os, em mai�sculo, cujo nome inicia com a letra v.
select UPPER(nomes)
from Servi�o 
where SUBSTRING(nomes,1,1) = 'v'

--4) Listar as resid�ncias com n�mero de quartos entre 2 e 4.
select *
from Residencia
where num_quartosR Between 2 and 4

--5) Exibir o codigoS e o codigoR, e o ano da data da solicita��o que perten�a � lista (2005,2007,2020)
select *
from Solicitar
where year(data_solicitacao) in ('2005','2007','2020')

--6) Quais as resid�ncias do cliente de nome Angelo?
select c1.nomeC, r1.enderecoR
from Residencia r1 inner join Cliente c1
on c1.cpfC = r1.cpfC
where c1.nomeC = 'Angelo'

--7) Quais servi�os nunca foram solicitados?
select t1.nomes, t2.codigoS
from Servi�o t1 left join Solicitar t2
on t1.codigoS = t2.codigoS
where t2.codigoS is NULL;

--8) Liste o nome do cliente, o endere�o de sua resid�ncia, e o nome do servi�o
select c.nomeC, r.enderecoR, s.nomes
from Cliente c
inner join Residencia r
on c.cpfC = r.cpfC
inner join Solicitar z
on r.codigoR = z.codigoR
inner join Servi�o s
on z.codigoS = s.codigoS;

--9) Quantas solicita��es de servi�o a resid�ncia de codigo X solicitou?

select count(*)
from servi�o s1 inner join solicitar s2
on s1.codigoS = s2.codigoS
inner join Residencia s3
on s2.codigoS = s3.codigoR
where s3.codigoR = 2


--10) Liste a quantidade de resid�ncias atendidas, por nome de servi�o, mas somente quantidades maiores que 1.
Select s.nomes, count(s.nomes)
From Solicitar z
Inner join Servi�o S
On z.codigos = s.codigos
Group by s.nomes;

--11) Qual a quantidade de quartos que um cliente possui ao somar todos os quartos das resid�ncias que possui?
Select c.nomeC, sum(r.num_quartosR) from Cliente c
Inner join Residencia r
On c.cpfC = r.cpfC
Group by c.nomeC;

-- 12) Exclua um servi�o de codigo X
Delete from Servi�o Where codigoS=4;

-- 13) Atualize o nome de um cliente
Update Cliente SET nomeC = �Flavio� where nomeC=�Angelo�;

-- 14) Crie duas tabelas cliente100 e residencia100: semelhante, em estrutura e dados, �s tabelas cliente e resid�ncia. Inclua as chaves prim�rias e estrangeiras nessas tabelas. Inclua uma linha em cliente100. Exclua os clientes que n�o possuem resid�ncias.

ALTER TABLE cliente100 ADD CONSTRAINT pf_cpfc100 PRIMARY KEY(cpfC);
ALTER TABLE residencia100 ADD CONSTRAINT pk_codigoR100 PRIMARY KEY(codigoR);
ALTER TABLE residencia100 ADD CONSTRAINT fk_cpf100 FOREIGN KEY(cpfC) REFERENCES Cliente(cpfC);
ALTER TABLE residencia100 ADD CONSTRAINT num_quartoR100 CHECK(num_quartoR < 3);

SELECT * FROM Cliente100;
SELECT * FROM Residencia100;

--Excluir clientes sem resid�ncia
DELETE Cliente100
FROM Cliente100
LEFT OUTER JOIN Residencia100
ON Cliente100.cpfC = Residencia100.cpfC
WHERE residencia100.codigoR IS NULL;
--15) Exclua a tabela resid�ncia. Crie a tabela residencia200 semelhante � tabela resid�ncia, com respectivas chaves. Inclua a op��o cascade, para exclus�o, em residencia200. Inclua uma linha em residencia200. Exclua um cliente referenciado em residencia200. O que ocorre?
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
IINSERT INTO Residencia200 VALUES (10,1,�RUA A�,50,111111),(20,2,�Avenida B�,65,200200), (30,2,�PRACA C�, 75, 300300);

SELECT * INTO Cliente200 FROM Cliente;
ALTER TABLE cliente200 ADD CONSTRAINT pf_cpfC200 PRIMARY KEY(cpfC);

-- O comando DELETE conflita com a restri��o do REFERENCE ��fk_codigoresidencia��
DELETE FROM Residencia WHERE cpfC = 111111; 

-- DELETADO
DELETE FROM Residencia WHERE cpfC = 111111; 

