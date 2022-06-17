use labbd

drop table dbo.aluno;
CREATE TABLE dbo.aluno
 (Id int NOT NULL,
 Nome varchar(25) NOT NULL,
 Endereço varchar (10),
 Cidade varchar (25) not null,
 Estado char (2) not null,
 Idade smallint ,
 constraint c2 primary key (Id)
 );
 insert into dbo.aluno
 values (1,'Marcos','Rua X', 'Sao Paulo', 'SP', 12);
 insert into dbo.aluno

 values (2,'Jose','Rua Z', 'Sao Paulo', 'SP',10);

 insert into dbo.aluno
 values (3,'Maria','Rua K', 'Rio de Janeiro', 'RJ',20);
 insert into dbo.aluno
 values (4,'Marta','Rua L', 'Porto Alegre' ,'RS',24);
 insert into dbo.aluno
 values (5,'Marta','Rua M', 'Canela' ,'RS',16);
 insert into dbo.aluno
 values (6,'Rosa','Rua N', 'Canela', 'RS', NULL);
 select * from dbo.aluno;


 select count (*) from dbo.aluno;     --Res: 6      COUNT: número de valores
 select count (Id) from dbo.aluno;    --Res: 6      
 select count (Idade) from dbo.aluno; --Res: 5
 select max (idade) from dbo.aluno;   --Res: 24     MAX: valor máximo
 select min (idade) from dbo.aluno;   --Res: 10     MIN: valor mínimo
 select avg (idade) from dbo.aluno;   --Res: 16     AVG: média de valores
 select sum (idade) from dbo.aluno;   --Res: 82     SUM: soma valores --O Resultado será NULL somente se não houver nenhum valor diferente de NULL; /*Todas as operações agregadas, exceto o count (*) ignoram as tuplas com
valores null nos atributos agregados*/ CREATE TABLE responsavel
 (id int not null,
 nome varchar(25) NULL,
 data_admissao datetime,
 constraint r1 primary key (id)
 );

CREATE TABLE material
 (codigoM int NOT NULL,
 descricao varchar(25) NOT NULL,
 preco decimal NOT NULL,
 unidade_mensuracao varchar(25) NOT NULL
 constraint m1 primary key (codigoM)
 );

 CREATE TABLE obra
 (numero int NOT NULL,
 endereco varchar(30) NULL,
 nome varchar(30)  NULL,
 id int not null,
 constraint o1 primary key(numero),
 constraint o2 foreign key(id)
               references responsavel(id)
 );

 CREATE TABLE utiliza
 (codigoM int NOT NULL,
 numero int NOT NULL,
 data_utilizacao datetime,
 quantidade int,
 constraint obr1 primary key (codigoM, numero, data_utilizacao),
 constraint obr2 foreign key (codigoM) references material(codigoM),
 constraint obr3 foreign key (numero) references obra(numero)
 );

  insert into responsavel
 values (100,'Flavio','2013/01/01') ;
   insert into responsavel
 values (200,'Lucas','2014/03/05') ;
   insert into responsavel
 values (300,'Rosana','2015/01/01') ;
   insert into responsavel
 values (400,'Rosa','2016/01/01') ;
   insert into responsavel
 values (500,'Daniel','2017/01/01') ;

 insert into material
 values (10,'prego',6.00 ,'kg') ;
 insert into material
 values (20,'parafuso',7.00 ,'kg') ;
 insert into material
 values (30,'martelo',3.00 ,'kg') ;
 insert into material
 values (40,'alicate',1.00 ,'kg') ;
 insert into material
 values (50,'cimento',1.00 ,'kg') ;

 insert into obra
 values (1000,'rua x','Edificio solar',100) ;
 insert into obra
 values (2000,'rua X','Usina Fantasia',100) ;
 insert into obra
 values (3000,'rua X','Edificio pimpolho',200) ;
 insert into obra
 values (4000,'rua X','Edificio solar',300) ;
 insert into obra
 values (5000,'rua X','Hidreletrica Sul de Minas',300) ;



 insert into utiliza values (10, 1000, '2021-01-12', 50)
 insert into utiliza values (20, 2000, '2021-01-12', 100)
 insert into utiliza values (30, 3000, '2021-01-12', 1)
 insert into utiliza values (40, 4000, '2021-01-12', 2)
 insert into utiliza values (50, 5000, '2021-01-12', 10)
 select * from utiliza

 --quantas obras você tem?     nesse caso a resposta deu 5
 select numObra = count(*) from obra; 
 select 'o número total de obras é ' + convert(char(2),count(*)) as numobras from obra;

 --valor total dos materiais
 select 'o valor que investi em material é ' + convert(char(2),sum(preco)) from material;

--soma total de preco utilizado
select 'soma total de preco utilizado' = SUM(t1.preco * t2.quantidade)
from material t1 inner join utiliza t2
on t1.codigoM = t2.codigoM


--total de alunos agrupados por idade
select * from aluno;
SELECT idade, COUNT (*) num_alunos from aluno group by idade;

--Valor médio das quantidades de materiais, utilizados nas obras, agrupados pela obra

select avg(t2.quantidade) , t1.nomefrom obra t1 inner join utiliza t2on t1.numero = t2.numerogroup by t1.nome--Quantidade de material agrupados pela unidade de mensuraçãoselect count(*), unidade_mensuracaofrom material group by unidade_mensuracao;--Valor máximo e mínimo dos preços dos materiais. select 'valor maximo' = max(preco) ,'valor minimo' = min(preco)from material--Quantidade de obras, agrupados pelo nome do responsável, cuja quantidade supere o valor 1.select t1.nome, count(*) as quantidadefrom responsavel t1 inner join obra t2on t1.id = t2.idgroup by t1.nome;--o preco do produto mais caro que o responsavel toma conta (PARAMOS AQUI)select t2.nome, t4.precofrom obra t1 inner join responsavel t2on t1.id = t2.idinner join utiliza t3on t3.numero = t1.numeroinner join material t4on t4.codigoM = t3.codigoMgroup by t2.nome