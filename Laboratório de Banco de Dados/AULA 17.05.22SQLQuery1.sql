use Labbd

CREATE TABLE dbo.professor
 (Id_prof int NOT NULL,
 Nome varchar(25) NOT NULL,
 Endereço varchar (10),
 idade smallint,
 constraint prof2 primary key (Id_prof)
 );
 insert into dbo.professor
 values (1,'Marcos','Rua L',40);

 insert into dbo.professor
 values (2,'Jose','Rua L',50);

 insert into dbo.professor
 values (3,'Laura','Rua L',30);

 select * from professor


CREATE TABLE disciplina
 (Id_disc int NOT NULL,
 Nome varchar(25) NOT NULL,
 CH smallint not null,
 Id_prof int null ,
 constraint disc1 primary key (Id_disc) ,
 constraint disc2 FOREIGN KEY (Id_prof) references
 professor (Id_prof)
 );
insert into dbo.disciplina
 values (11,'Matematica',200,1);

 insert into dbo.disciplina
 values (12,'Portugues',200,2);
 insert into dbo.disciplina
 values (13,'Geografia',200,null);
 select * from dbo.disciplina; select * from dbo.disciplina;select * from professor;
select * from disciplina;
select t1.id_prof, t1.nome, t2.id_disc, t2.nome
from professor t1 inner join disciplina t2
on t1.Id_prof = t2.id_prof;

select t1.id_prof, t1.nome, t2.id_disc, t2.nome
from professor t1 left join disciplina t2
on t1.Id_prof = t2.id_prof;

select t1.id_prof, t1.nome, t2.id_disc, t2.nome
from professor t1 right join disciplina t2
on t1.Id_prof = t2.id_prof;

select t1.id_prof, t1.nome, t2.id_disc, t2.nome
from professor t1 full join disciplina t2
on t1.Id_prof = t2.id_prof;

drop table formacao
 CREATE TABLE formacao
 (Id_form int NOT NULL,
 Nome varchar(25) NOT NULL,
 constraint for1 primary key (Id_form)
 );
insert into formacao values (10, 'doutor');
insert into formacao values (20, 'mestre');
insert into formacao values (30, 'graduação superior');
 select * from formacao

 CREATE TABLE temformacao
 (Id_form int NOT NULL foreign key references formacao,
 Id_prof int NOT NULL foreign key references professor,
 constraint tem1 primary key (Id_form, Id_prof),
 constraint tem2 foreign key (Id_form) references formacao(Id_form),
 constraint tem3 foreign key (Id_prof) references professor(Id_prof)
 );

insert into temformacao values (10, 1);
insert into temformacao values (20, 2);
insert into temformacao values (30, 3);

select * from temformacao;

select * from disciplina
select * from professor
select t1.id_prof , t1.nome, t2.id_disc, t2.nome
from professor t1 cross join disciplina t2;

/*self join - join com a própria tabela*/
drop table funcionario;

CREATE TABLE funcionario
 (Id_func int NOT NULL primary key,
 Nome varchar(25) NOT NULL,
 Endereço varchar (10),
 Idade smallint,Id_coord int null,
 constraint f1 foreign key (id_coord) references funcionario(Id_func)
 );

insert into funcionario
values (1,'Marcos','Rua L',40, null);

insert into funcionario
values (2,'Jose','Rua L',50, 1);

insert into funcionario
values (3,'Laura','Rua L',30, 2);

select * from funcionario

select t2.id_func, t2.nome, t1.id_func, t1.nome
from funcionario t1 inner join funcionario t2
on t1.Id_func = t2.id_coord;

/*exercicio*/

CREATE TABLE fornecedor
 (Id_fornecedor int NOT NULL primary key,
 Nome varchar(25) NOT NULL
 );
CREATE TABLE produto
 (Id_produto int NOT NULL primary key,
 Nome varchar(25) NOT NULL,
 Id_forn int null,
 constraint forne foreign key (Id_forn) references fornecedor(Id_fornecedor)
 );


insert into produto values (1,'lixeira');
insert into produto values (2,'vassoura');
insert into produto values (3,'pá');

insert into fornecedor values (1,'extra');
insert into fornecedor values (2,'bahia');
insert into fornecedor values (3,'assai');

/*liste o nome do fornecedor e o nome de seus produtos*/
select f1.nome, p1.nome
from fornecedor f1 inner join produto p1
on f1.Id_fornecedor = p1.Id_produto;