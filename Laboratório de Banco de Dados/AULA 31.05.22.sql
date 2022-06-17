use labbd

drop table dbo.aluno;

CREATE TABLE dbo.aluno
 (Id int NOT NULL,
 Nome varchar(25) NOT NULL,
 Endere�o varchar (10),
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


 select count (*) from dbo.aluno;     --Res: 6      COUNT: n�mero de valores
 select count (Id) from dbo.aluno;    --Res: 6      
 select count (Idade) from dbo.aluno; --Res: 5
 select max (idade) from dbo.aluno;   --Res: 24     MAX: valor m�ximo
 select min (idade) from dbo.aluno;   --Res: 10     MIN: valor m�nimo
 select avg (idade) from dbo.aluno;   --Res: 16     AVG: m�dia de valores
 select sum (idade) from dbo.aluno;   --Res: 82     SUM: soma valores
 --O Resultado ser� NULL somente se n�o houver nenhum valor diferente de NULL;
 /*Todas as opera��es agregadas, exceto o count (*) ignoram as tuplas com
valores null nos atributos agregados*/


 CREATE TABLE responsavel
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

 --quantas obras voc� tem?     nesse caso a resposta deu 5
 select numObra = count(*) from obra; 
 select 'o n�mero total de obras � ' + convert(char(2),count(*)) as numobras from obra;

 --valor total dos materiais
 select 'o valor que investi em material � ' + convert(char(2),sum(preco)) from material;

--soma total de preco utilizado
select 'soma total de preco utilizado' = SUM(t1.preco * t2.quantidade)
from material t1 inner join utiliza t2
on t1.codigoM = t2.codigoM


--total de alunos agrupados por idade
select * from aluno;
SELECT idade, COUNT (*) num_alunos from aluno group by idade;

--Valor m�dio das quantidades de materiais, utilizados nas obras, agrupados pela obra

select avg(t2.quantidade) , t1.nome
from obra t1 inner join utiliza t2
on t1.numero = t2.numero
group by t1.nome

--Quantidade de material agrupados pela unidade de mensura��o
select count(*), unidade_mensuracao
from material 
group by unidade_mensuracao;

--Valor m�ximo e m�nimo dos pre�os dos materiais. 
select 'valor maximo' = max(preco) ,'valor minimo' = min(preco)
from material

--Quantidade de obras, agrupados pelo nome do respons�vel, cuja quantidade supere o valor 1.

select t1.nome, count(*) as quantidade
from responsavel t1 inner join obra t2
on t1.id = t2.id
group by t1.nome;

--o preco do produto mais caro que o responsavel toma conta (PARAMOS AQUI)

select t2.nome, t4.preco
from obra t1 inner join responsavel t2
on t1.id = t2.id
inner join utiliza t3
on t3.numero = t1.numero
inner join material t4
on t4.codigoM = t3.codigoM
group by t2.nome

--31/05/22
--HAVING: ele � a condi��o + o agrupamento
--group by: � apenas o agrupamento
select idade, count (*) num_alunos 
from dbo.aluno 
group by idade
having count (*) > 1;

CREATE TABLE substitui
( id int not null,
  idsubstituido int not null,
  data_substitui��o datetime,
  motivo varchar(30),
  constraint s1 primary key (id,idsubstituido),
  constraint s2 foreign key (id) references responsavel(id),
  constraint s3 foreign key (idsubstituido) references responsavel(id)
)

insert into substitui values (100,200, '2022-01-01','ferias')
insert into substitui values (100,300, '2022-01-01','doenca')
insert into substitui values (400,500, '2022-01-01','ferias')
insert into substitui values (200,300, '2022-01-01','doenca')

--listar o total de material por obra, por�m apenas as obras com um total menor que 100
select t2.nome, sum(t1.quantidade) as total from utiliza t1 inner join obra t2
on t1.numero = t2.numero group by t2.nome
having sum(t1.quantidade) < 100

--listar o total de responsaveis substituidos por responsavel que substitui

select t1.nome, count(*) as total
from substitui t2 inner join responsavel t1
on t1.id = t2.id 
where t1.nome like 'R%'
group by t1.nome
having count(*) > 1

--listar o numero de obras por responsavel (nome)
--mas apenas o responsavel com um numero maior que 2
select * from obra
select * from responsavel

select t1.nome, count(*) as total
from obra t2 inner join responsavel t1
on t1.id = t2.id 
group by t1.nome
having count(*) >= 2

--listar o nome do responsavel e o nome substituido

select t1.nome, t3.nome
from substitui t2 inner join responsavel t1
on t1.id = t2.id 
inner join responsavel t3
on t3.id = t2.idsubstituido

--UPDATE: mudar os valores de um ou mais atributos


update aluno
set Nome= 'Marcos',
 Estado='RJ'
where id=1
select * from aluno

--atualizar a unidade de mensuracao para cx em cimento
update material set unidade_mensura��o = 'cx'
where descricao = 'cimento'

--atualizar o nome para marcos e estado para RJ, onde tenha o id 1
select * from aluno
update aluno set Nome='Marcos' , Estado='RJ'
where id=1

--atualizar 2022 para 2019
select * from substitui

update substitui
set data_substitui��o = '2019-01-01',
    motivo = 'feriado'
where id = 400 or id = 100

--alterar o preco para 30,00 dos materiais cujo codigo varie entre 30 e 50 (inclusive)
select * from material

update material
set preco = 30.00
where codigoM between 30 and 50



alter table aluno1
add constraint alu11 primary key (id)

create table tarefas
(codigo int,
nome varchar(30),
id int foreign key (id) references
aluno(id)
)

insert into tarefas
values (1,'matematica',1)
insert into tarefas
values (2,'portugues',2)

--Atualiza o endere�o de aluno1 cujo estado � RJ e este possui tarefa associada.
update aluno set Estado='RS' where id=1

select * from tarefas

update aluno
set endere�o='novo '
from aluno t1 inner join tarefas t2
on t1.id = t2.id
where t1.estado = 'RS'
select * from aluno
update aluno set Estado='RJ' where id=1



alter table responsavel1
add constraint o11 primary key (numero)

alter table obra2
add constraint o12 foreign key(id)
		references responsavel(id)

 CREATE TABLE responsavel1
 (id int not null,
 nome varchar(25) NULL,
 data_admissao datetime,
 constraint r3 primary key (id)
 );

 CREATE TABLE obra1
 (numero int NOT NULL,
 endereco varchar(30) NULL,
 nome varchar(30)  NULL,
 id int not null,
 constraint y1 primary key(numero),
 constraint y2 foreign key(id)
               references responsavel1(id)
 );

--DELETE (exclue um dado dentro da tabela)
--o drop table (deleta a tabela toda)
--excluir a obra de numero 5000
delete from obra1 where id = 5000

--excluir a obra de numero 5000
delete from obra1 where id = 5000

