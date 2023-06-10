--criar um novo database
CREATE DATABASE teste

/* usar os dados da base de dados*/
use teste;

drop table bonusipi
go
drop table participaipi
go
drop table estrangeiroipi
go
drop table nacionalipi
go
drop table possuiipi
go
drop table pedidoipi
go
drop table relacionaipi
go
drop table clienteipi
go
drop table escreveipi
go
drop table livroipi
go
drop table categoriaipi
go
drop table acaosocialipi
go
drop table autoripi
go

create table categoriaipi
(
  codigo_cat tinyint not null,
  descricao_cat varchar(30) not null,
  constraint catipi1 primary key (codigo_cat )
);
insert into categoriaipi values (1,'Romance');
insert into categoriaipi values (2,'Aventura');
insert into categoriaipi values (3,'Ficção');
insert into categoriaipi values (4,'Terror');

select * from categoriaipi;

create table autoripi
(      
 codigo_aut int not null, 
 nome_aut varchar(30) not null, 
 fone_aut decimal (9,0) null,
 constraint autipi1 primary key (codigo_aut  )
);

/**incluir data de nascimento em autor**/
alter table autoripi add 
            data_nascimento datetime null;

insert into autoripi values (10,'Jose Silva', 999999999, '1950-01-03');
insert into autoripi values (20,'Maria Rita', 888888888, '1960-02-07');
insert into autoripi values (30,'Gilberto Gil', 777777777, '1954-11-08');
select * from autoripi;



create table acaosocialipi
(      
identificacao_acs int not null, 
descricao_acs varchar(30) not null, 
data_acs datetime null,
constraint acsipi1 primary key (identificacao_acs)
);
insert into acaosocialipi values (100,'ONG Juventude', '2017-10-04');
insert into acaosocialipi values (200,'Fome Zero', '2018-04-05');
insert into acaosocialipi values (300,'Casa Idoso', '2015-07-06');
select * from acaosocialipi ;

create table livroipi
(      
codigo_liv int not null, 
nome_liv varchar(30) not null, 
valor_liv decimal (5,2) null,
codigo_cat tinyint not null,
constraint livipi1 primary key (codigo_liv),
constraint livipi2 foreign key (codigo_cat)
           references categoriaipi (codigo_cat)
);

insert into livroipi values (1000,'Anda com Fe', 40.50,1 );
insert into livroipi values (2000,'Maria Maria', 2.30,3 );
insert into livroipi values (3000,'Show das poderosas', 20.30,2 );
insert into livroipi values (1001,'Sereia na praia', 100.00,1 );
insert into livroipi values (2001,'Irene ri', 200.30,2 );
insert into livroipi values (3001,'Terremoto maldito', 25.30,3 );
select * from livroipi ;

create table escreveipi
(      
codigo_liv int not null, 
codigo_aut int not null, 
constraint esipic1 foreign key (codigo_liv)
           references livroipi (codigo_liv), 
constraint esipic2 foreign key (codigo_aut )
           references autoripi (codigo_aut),
constraint esipic3 primary key (codigo_liv,codigo_aut)
);

insert into escreveipi values (1000,10 );
insert into escreveipi values (2000,20);
insert into escreveipi values (3000,30 );
insert into escreveipi values (1001, 10);
insert into escreveipi values (2001, 20);
insert into escreveipi values (3001, 30);
select * from escreveipi;


create table clienteipi
(      
cpf_cli decimal(11,0) not null, 
nome_cli varchar(30) not null, 
email_cli varchar(30) null,
constraint cliipi1 primary key (cpf_cli)
);

/**** alterar tabela***/

/*1) incluir sexo e data de nascimento em cliente*/

alter table clienteipi add sexo char(1) null,
            data_nascimento datetime null


insert into clienteipi values (11111111111,'Rosa Goncalves', 'rosa.G@gmail.com','F','2000-01-01');
insert into clienteipi values (22222222222,'Bruno Dias', 'Bruno.D@hotmail.com', 'M', '1973-02-02');
insert into clienteipi values (33333333333,'Gabriel Sousa', 'Gabriel.S@gmail.com', 'M', '1973-03-02');

select * from clienteipi;

create table relacionaipi
(      
cpf_cli decimal(11,0) not null, 
cpf_cli1 decimal(11,0) not null,
forma_rel varchar(30) not null,
constraint relipi1 foreign key (cpf_cli)
           references clienteipi (cpf_cli),
constraint relipi2 foreign key (cpf_cli1 )
           references clienteipi (cpf_cli),
constraint relipi3 primary key (cpf_cli, cpf_cli1)
);

insert into relacionaipi values (11111111111,22222222222, 'filho');
insert into relacionaipi values (22222222222,33333333333, 'amigo');
insert into relacionaipi values (33333333333,11111111111, 'amigo');
select * from relacionaipi;


create table pedidoipi
(      
codigo_ped int not null, 
data_ped datetime not null, 
cpf_cli decimal(11,0) not null, 
valordesconto_ped decimal(5,2) null,
constraint pedipi1 primary key (codigo_ped),
constraint pedipi2 foreign key (cpf_cli)
           references clienteipi (cpf_cli)
);

insert into pedidoipi values (10000,'2023-01-01', 11111111111, 20.0);
insert into pedidoipi values (20000,'2022-09-04', 22222222222, 20.0);
insert into pedidoipi values (30000,'2022-07-01',33333333333, 20.0);

select * from pedidoipi;

update pedidoipi set valordesconto_ped = 10.00 where codigo_ped = 10000
update pedidoipi set valordesconto_ped = 20.00 where codigo_ped = 20000
update pedidoipi set valordesconto_ped = 30.00 where codigo_ped = 30000

create table possuiipi
(      
codigo_ped int not null, 
codigo_liv int not null,  
quantidade_pos int not null, 
constraint posipi1 foreign key (codigo_ped)
           references pedidoipi (codigo_ped),
constraint posipi2 foreign key (codigo_liv)
           references livroipi (codigo_liv),
constraint posipi3 primary key (codigo_ped,codigo_liv )
);

insert into possuiipi values (10000,1000, 1);
insert into possuiipi values (20000,2000, 1);
insert into possuiipi values (30000,3000,1);

select * from possuiipi 


create table nacionalipi
(      
 codigo_aut int not null, 
 numpublica_nac int not null, 
 constraint naipic1 primary key (codigo_aut),
 constraint naipic2 foreign key (codigo_aut)
           references autoripi (codigo_aut),
);

insert into nacionalipi values (10,1);
insert into nacionalipi values (20,2);
select * from nacionalipi


create table estrangeiroipi
(      
 codigo_aut int not null, 
 especializacao_est varchar(30) not null, 
 constraint estipi1 primary key (codigo_aut),
 constraint estipi2 foreign key (codigo_aut)
           references autoripi (codigo_aut),
);
insert into estrangeiroipi values (30,'romancista');

select * from estrangeiroipi;


/*default em data da participação*/

create table participaipi
(      
codigo_aut int not null, 
identificacao_acs int not null,  
data_par datetime not null default '2019-1-1', 
constraint paripi1 foreign key (codigo_aut)
           references autoripi (codigo_aut),
constraint paripi2 foreign key (identificacao_acs)
           references acaosocialipi (identificacao_acs),
constraint paripi3 primary key (codigo_aut,identificacao_acs )
);

insert into participaipi values (10,100, '2018-1-1');
insert into participaipi values (20,200, '2017-1-1');
select * from participaipi 


/*** regra de megocio: o premio não pode 
ultrapassar do valor 200,00 ***/

create table bonusipi
(      
 codigo_bon int not null, 
 premio_bon decimal(5,2) not null, 
 codigo_aut int not null, 
 identificacao_acs int not null, 
 constraint bonipi1 primary key (codigo_bon),
 constraint bonipi2 foreign key (codigo_aut,identificacao_acs ) 
           references participaipi (codigo_aut,identificacao_acs ),
constraint bonipi3 check (premio_bon < 200.00)
 );

insert into bonusipi values (100000, 50.00,10,100);
insert into bonusipi values (200000,30.00, 20,200);
select * from bonusipi ;

/**** alterar tabela***/

/**1) alterar nome da categoria para ser unica**/
alter table categoriaipi
add constraint catipi2 unique (descricao_cat)

/**se quiser eliminar ....
alter table categoria
drop constraint catipi2**/

/**2) incluir regra de negócio em numero de publicações < 4
**/
alter table nacionalipi
add constraint naipic5 check (numpublica_nac < 4)


/*exercicios
2) Listar data da compra e o valor do desconto, pertencente a lista (xx, xy, zy, ky), na forma:
 Este é o valor do desconto: xxx, das compras com data de 3 dias atrás. */

SELECT CONCAT('Este é o valor do desconto: ', valordesconto_ped, ', das compras com data de 3 dias atrás.') as mensagem, data_ped,
numerodias = datediff (day, getdate (), data_ped )
FROM pedidoipi where DATEDIFF(DAY, data_ped,GETDATE()) >= 3



insert into pedidoipi values (40000,'2023-03-12',33333333333,10.00);

select 
numerodias = datediff (day, data_ped, getdate () )
from pedidoipi 

select * from pedidoipi
/*3) Exibir o código e a descrição das categorias no formato:
 A Unilivros comercializa livros de categoria: xxxxxx código yy*/
 select cabeçalho ='A Unilivros comercializava livros da categoria:', descricao_cat as descrição, codigo='Codigo: ', codigo_cat as codigo from categoriaipi

 /*4) Listar o código, o nome e o valor, acrescido de 10%, nos livros que possuem as letras A ou E no
segundo caractere.*/
SELECT codigo_cat, nome_liv, valor_liv * 1.1 AS valor_com_acrescimo
FROM livroipi
WHERE nome_liv LIKE '_[AE]%' ;

/*5) Listar os autores que possuem código entre 10 e 40, e possuem nome que iniciam com a letra A,
segunda letra qualquer, terceira letra não pode ser B, quarta letra entre A ou G e demais caracteres.*/
SELECT * FROM autoripi
WHERE codigo_aut BETWEEN 10 AND 40
AND nome_aut LIKE 'A_[^B][A_G]%';

select * from autoripi

/*6) Exibir a frase:
 O autor de código yyy tem especialidade XXXX .
Convertendo a especialidade do autor para maiúscula eliminando brancos a esquerda e a direita*/
 select 
 cabeçalho ='O autor de codigo:', codigo_aut as codigo, 
 especialidade = 'tem especialidade', UPPER(RTRIM(LTRIM(especializacao_est)))
 from  estrangeiroipi



/*1) Faça um relatório com o nome dos clientes, cujo nome inicia com a letra A, a data
dos seus pedidos, o nome dos livros e o valor dos livros comprados por cada
cliente, cujo valor seja menor que 100,00.

tabelas: cliente pedido possui livro*/

select a.nome_cli, b.data_ped, d.nome_liv, d.valor_liv
from clienteipi a inner join pedidoipi b
on a.cpf_cli = b.cpf_cli
inner join possuiipi c on b.codigo_ped = c.codigo_ped
inner join livroipi d on c.codigo_liv  = d.codigo_liv
WHERE nome_cli LIKE 'A%' and valor_liv < 100.00

/*2) Faça um relatório com o nome do livro e o nome de sua categoria. A categoria pode
ser: Romance, Ciência e Cozinha.*/
select b.nome_liv , a.descricao_cat 
from categoriaipi a inner join livroipi b
on a.codigo_cat = b.codigo_cat

/*3) Faça um relatório com os dados dos clientes, que nasceram em janeiro, e
compraram livros de autores nacionais.*/
select 'Comprou livros nacionais: ', t1.nome_cli 
from clienteipi t1 inner join pedidoipi t2 on t1.cpf_cli = t2.cpf_cli 
inner join possuiipi t3 on t2.codigo_ped = t3.codigo_ped 
inner join livroipi t4 on t3.codigo_liv = t4.codigo_liv 
inner join escreveipi t5 on t4.codigo_liv = t5.codigo_liv 
inner join autoripi t6 on t5.codigo_aut = t6.codigo_aut
inner join nacionalipi t7 on t6.codigo_aut  = t7.codigo_aut  
where DATEPART(MONTH,t1.data_nascimento) = MONTH(1)

/*7) Faça um relatório listando quais os relacionamentos do cliente xxxx*/
select t1.cpf_cli,t2.cpf_cli1, t2.forma_rel 
from relacionaipi t1 inner join relacionaipi t2 on t1.cpf_cli = t2.cpf_cli

/*9) Faça um relatório dos clientes que não compraram livros.*/
SELECT 'Clientes que não compraram livros: ', t1.nome_cli 
from clienteipi t1 left outer join pedidoipi t2 on t1.cpf_cli=t2.cpf_cli 
where codigo_ped is null

/*Total de livros e agrupe por categoria*/
select COUNT (*), codigo_cat 
from livroipi
group by codigo_cat
having COUNT(*) < 2

/*20/03/2023*/
/*1.Valor do livro mais caro comprado pelos clientes*/
select a.nome_cli, max(d.valor_liv)
from clienteipi a inner join pedidoipi b
on a.cpf_cli = b.cpf_cli
inner join possuiipi c on b.codigo_ped = c.codigo_ped
inner join livroipi d on c.codigo_liv  = d.codigo_liv
group by a.nome_cli

/*2.Qual o valor máximo do livro por categoria*/
select a.descricao_cat, max(b.valor_liv)
from categoriaipi a inner join livroipi b
on a.codigo_cat = b.codigo_cat
group by a.descricao_cat

/*3.Obter a média de preços dos livros comprados pelo cliente, agrupados por sexo,
mas apenas dos clientes que compram acima de 20.00 (em média). */
select a.sexo, avg(d.valor_liv)
from clienteipi a inner join pedidoipi b
on a.cpf_cli = b.cpf_cli
inner join possuiipi c on b.codigo_ped = c.codigo_ped
inner join livroipi d on c.codigo_liv  = d.codigo_liv
group by a.sexo having avg(d.valor_liv) > 20.00

/*12. Exibir os meses de nascimento dos autores que também são meses de
nascimento dos clientes*/
select DATEPART(MONTH,data_nascimento) from clienteipi
intersect
select DATEPART(MONTH,data_nascimento) from autoripi

select * from clienteipi
select * from autoripi

insert into autoripi values (1203,'matheus', 999999999, '2001-11-11');
insert into clienteipi values (11121153,'martias', 'rosa.G@gmail.com','F','2001-12-12');

/*13.Exibir todos os meses de nascimento dos autores como também dos
clientes*/
select DATEPART(MONTH,data_nascimento) as 'Meses Nascimento' from autoripi
union all
select DATEPART(MONTH,data_nascimento) from clienteipi

/*4.Listar os valores dos livros que sejam menores que QUALQUER dos valores
dos livros comprados por rosa*/
select valor_liv from livroipi where valor_liv < ANY (select  d.valor_liv
from clienteipi a inner join pedidoipi b
on a.cpf_cli = b.cpf_cli
inner join possuiipi c on b.codigo_ped = c.codigo_ped
inner join livroipi d on c.codigo_liv  = d.codigo_liv
where a.nome_cli = 'Rosa Goncalves') 

/*5.Listar os valores dos livros cujos valores sejam menores que TODOS os valores
dos livros comprados por rosa*/
select valor_liv from livroipi where valor_liv < ALL (select  d.valor_liv
from clienteipi a inner join pedidoipi b
on a.cpf_cli = b.cpf_cli
inner join possuiipi c on b.codigo_ped = c.codigo_ped
inner join livroipi d on c.codigo_liv  = d.codigo_liv
where a.nome_cli = 'Rosa Goncalves') 

/*6.Se existir autor, exiba os livros*/
SELECT * from livroipi where EXISTS (select * from
autoripi);

/*7.Se não existir autor nacional, liste os estrangeiros */
SELECT * from estrangeiroipi where NOT EXISTS (select * from
nacionalipi);

select * from estrangeiroipi
select * from nacionalipi
DELETE FROM nacionalipi WHERE codigo_aut = 20; 

/*selects: cliente - pedido - possui - livro*/
select cpf_cli from clienteipi where cpf_cli in (
select cpf_cli from pedidoipi where codigo_ped in(
select codigo_ped from possuiipi where codigo_liv in(
select codigo_liv from livroipi)))


/*clientes que compraram livros - SubQuery (sem innerJOIN)*/
select cpf_cli, nome_cli from clienteipi
where cpf_cli not in (select cpf_cli from pedidoipi)


/*tabelas professor e aluno*/
DROP table professoripi
go
drop table alunoipi
go
drop table disciplinaipi

create table professoripi
(      
 Id_prof int not null, 
 nome varchar(30) not null,
 endereco varchar(30) not null, 
 idade smallint not null,
 constraint cdprofessor primary key (Id_prof)
);

create table alunoipi
(      
 codigo_aluno int not null, 
 nome varchar(30) not null,
 endereco varchar(30) not null, 
 idade smallint not null,
 constraint cdaluno primary key (codigo_aluno)
);

CREATE TABLE disciplinaipi
 (Id_disc int NOT NULL,
 Nome varchar(25) NOT NULL,
 CH smallint not null,
 Id_prof int null ,
 constraint discc1 primary key (Id_disc),
 constraint discc2 foreign key (Id_prof) references
 professor (Id_prof)
 );

 insert into disciplinaipi
 values (11,'Matematica',200,1);
 select * from disciplina;

 insert into disciplinaipi
 values (12,'Portugues',200,2);
 select * from disciplina;

 insert into disciplinaipi
 values (13,'Geografia',200,null);
 select * from disciplina;

insert into professoripi values (1,'Flavia', 'Rua livo', 44);
insert into professoripi values (2,'Antonio', 'Rua delmon', 33);
insert into professoripi values (3,'Flavia', 'Rua São Paulo', 54);
insert into professoripi values (4,'Flavio', 'Rua São Paulo', 70);
insert into professoripi values (5,'vitoria', 'Rua São Paulo', 76);
insert into alunoipi values (1,'Roger', 'Rua livo', 21);
insert into alunoipi values (4,'Weiller', 'Rua delmon', 31);
insert into alunoipi values (6,'Denis', 'Rua França', 25);

select idade from alunoipi
select idade from professoripi
select idade from alunoipi where idade NOT in (15,15,20)

select nome, idade from alunoipi where idade < all (select idade from
professoripi);

select nome, idade from alunoipi where idade < ANY (select idade from
professoripi);

/*27/03/2023*/
select * from livroipi a 
where codigo_cat in (select codigo_cat from categoriaipi)

select * from livroipi a 
where codigo_cat in (select codigo_cat from categoriaipi e where a.codigo_cat = e.codigo_cat)

select * from ((select codigo_cat from livroipi) a inner join (select codigo_cat from categoriaipi) e on a.codigo_cat = e.codigo_cat)

--view (tabela virtual): o resultado é apresentado como uma tabela
--o sql armazena o SELECT e não a tabela fisica
--cria:
CREATE VIEW V1
AS
 SELECT Id_prof , nome FROM professoripi

 --apaga:
 DROP VIEW V1

 select nome from v1 where Id_prof = 5


/*1.Listar os clientes cujo nome inicia com a letra G, e
compraram livros com valor < 100,00*/
CREATE VIEW V2
AS
 select a.nome_cli, d.valor_liv
from clienteipi a inner join pedidoipi b
on a.cpf_cli = b.cpf_cli
inner join possuiipi c on b.codigo_ped = c.codigo_ped
inner join livroipi d on c.codigo_liv  = d.codigo_liv
WHERE nome_cli LIKE 'G%' and valor_liv < 100.00


select nome_cli from V2



/*view (tabela virtual) mudando o cabeçalho*/
CREATE VIEW v_disciplina_professor
(Id_prof, nome_prof, id_disc, nome_disc)
as
Select t1.id_prof, t1.nome,
 t2.id_disc, t2.nome
from professoripi t1 inner join
 disciplinaipi t2
on t1.id_prof = t2.Id_prof;

select * from v_disciplina_professor


/*2.Quais as disciplinas do professor mais idoso? Crie uma view obtendo a maior idade.
Utilize a view para obter as disciplinas.*/
create view V22
as select max(idade) as maior from professoripi

Select t1.id_prof,  t1.Nome,t2.id_disc,  t2.nome,t1.idade 
from   professoripi t1   inner  join disciplinaipi  t2 
on t1.id_prof = t2.id_prof inner join idade t3
on t1.idade = t3.maior

/*3.Quais as disciplinas com CH menor que o menor CH das disciplinas lecionadas pelo
professor com id_prof=1.*/
create view V33 as
select min(ch) as minimo from disciplinaipi
where Id_prof = 1

select t1.* from disciplina t1
inner join V33 t2 on t1.ch < t2.minimo

/*coluna computada*/
CREATE VIEW v_disciplina_novo_ch (id_disc, nome, ch_d)
as
Select t1.Id_disc , t1.Nome ,
 Ch * 2
from disciplina t1

/*4.Listar os nomes (NOME a ser exibido como cabeçalho ) dos
autores estrangeiros que escrevem livros da categoria
Aventura.*/

create view V5 (NOME)
as
 select a.nome_aut from autoripi a inner join estrangeiroipi b
on a.[codigo_aut]=b.[codigo_aut]
inner join escreveipi c
on c.[codigo_aut]= a.[codigo_aut]
inner join livroipi d
on d.[codigo_liv] = c.[codigo_liv]
inner join categoriaipi e
on d.[codigo_cat] = e.[codigo_cat]
where [descricao_cat] = 'Aventura'


--03/04/23
Create view vtodasaspessoas as
 Select nome, idade from aluno
 Union
 Select nome,idade from professor

 select * from vtodasaspessoas


 --view que usa a view de cima
 Create view vpessoamenor40 as
 Select nome, idade from vtodasaspessoas
 Where idade < 40

 select * from vpessoamenor40

  --view que usa a view de cima
 Create view vtotalnome as
 Select count(nome) as total from vpessoamenor40

 select * from vtotalnome

 --Procedimento de expansão
 select count(nome) as total from
 ( select nome, idade from
 ( select nome, idade from aluno
 union
 select nome,idade from professor
 ) a
 where idade < 40
 )b

 --1.Crie duas views e um procedimento de expansão (sem view)
 Create view professorMaior50 as
 Select nome, idade from professoripi
 Where idade > 50

 select * from professorMaior50

 --view que usa a de cima
 Create view professorNome as
 Select nome from professorMaior50
 where nome LIKE 'F%'

 select * from professorNome
 
 --expansão (sem view)
 select nome from
 (select nome, idade from professoripi
 ) a
 Where idade > 50 and nome LIKE 'F%'



 --atualização com view
 UPDATE v_disciplina_professor
Set nome_prof = 'Amelia' where id_prof = 2;
SELECT * FROM v_disciplina_professor;

UPDATE v_disciplina_professor
Set nome_disc = 'Historia' where id_prof= 2;
SELECT * FROM v_disciplina_professor;
select * from disciplinaipi

--Crie duas tabelas semelhante a disciplina e professor e faça id_prof = 2 assumir duas disciplinas.
 select * into professoripi2 from professoripi
 select * into disciplinaipi2 from disciplinaipi

alter table disciplinaipi2 add constraint
d101 primary key (id_disc)
alter table disciplinaipi2 add constraint
d102 foreign key (id_prof) references
professor (id_prof)

insert into disciplinaipi2 values (15,'banco',2000,3)
select * from disciplinaipi2
/*alterar Geografia para o professor 2*/
update disciplinaipi2 set id_prof=2 where id_disc = 13
select * from disciplinaipi2


CREATE VIEW v_disciplinaipi2_professoripi2 (id_prof, nome_prof, id_disc,
nome_disc)
as
Select t1.id_prof, t1.nome,
 t2.id_disc, t2.nome
from professoripi2 t1 inner join
 disciplinaipi2 t2
on t1.id_prof = t2.id_prof;

select * from v_disciplinaipi2_professoripi2;


/*Agora atualizar disciplina pela view e verificar que duas disciplina
assumem o mesmo nome, ou seja, precisaremos ter certos cuidados para
escolher a atualização desejada*/
UPDATE v_disciplinaipi2_professoripi2
Set nome_disc = 'Historia' where id_prof= 2;
select * from disciplinaipi2;


--Modificação não pode ser feita em colunas computadas (coluna com calculo)    Exemplo: ch_d da view disciplina_novo_ch 
update v_disciplina_novo_ch
set ch_d = 8 where id_disc = 11;

--2. Criar uma view que atualiza o valor do preço do livro para 50% a mais.
 Create view precoLivro2 (codigo_liv, valor_liv) as
 Select codigo_liv , (valor_liv * 0.5)  from livroipi

UPDATE precoLivro2
Set valor_liv = 100 where codigo_liv = 2000;




CREATE VIEW v_disciplina_descricao_1
as
 Select id_disc , Nome , ch
 from disciplina
 Where id_disc > 11 ;

INSERT INTO v_disciplina_descricao_1
VALUES (14,'CIÊNCIAS', 100);

select * from disciplina;

--3. Criar uma view usando o nome e o cpf do cliente. Usando a view, faça um insert em cliente.
--Em seguida, faça uma view usando apenas o cpf do cliente. Em seguida, faça um insert pela view. O que ocorre?
Create view cliente_1 (nome_cli, cpf_cli) as
Select nome_cli, cpf_cli from clienteipi;

--não ocorre erro, pois as duas colunas foram preenchidas
INSERT INTO cliente_1
VALUES ('Bruno Dias', 11111118111);

Create view cliente_2 (cpf_cli) as
Select cpf_cli from clienteipi;

--ocorre ERRO, pois o nome_cli não aceita o valor NULO.
INSERT INTO cliente_2
VALUES (11111118111);




drop view v_disciplina_descricao;

CREATE VIEW v_disciplina_descricao
as
Select id_disc , Nome , CH, id_prof
from disciplinaipi
Where id_disc between 2 and 14
WITH CHECK OPTION; --with check option: verifica a regra(where) da view (só deixa fazer algo se estiver na regra da view)

--não deixou inserir, devido ter colocado WITH CHECK OPTION
INSERT INTO v_disciplina_descricao
VALUES (16,'BANCO DE DADOS',200,2);


--4. Criar uma view para obter as categorias com código entre 1 e 3. Inserir uma nova categoria com código 4.
--O que ocorre? Implemente uma solução para invalidar uma inserção que viole as regras da view.
CREATE VIEW v_categoriaipi
as
select * from categoriaipi
where codigo_cat between 1 and 3
WITH CHECK OPTION;

--não deixou inserir, devido ter colocado WITH CHECK OPTION
INSERT INTO v_categoriaipi
VALUES (4,'Terror');

--5. Faça duas views: uma lista o valor máximo do livro por categoria; a segunda com valor mínimo do livro por categoria. Usando as duas
--views, elabore uma consulta que mostra os valores máximo e mínimo do livro por categoria.
CREATE VIEW vMax_categoriaipi
as
select a.descricao_cat, max(b.valor_liv) as 'valor máximo'
from categoriaipi a inner join livroipi b
on a.codigo_cat = b.codigo_cat
group by a.descricao_cat

CREATE VIEW vMin_categoriaipi
as
select a.descricao_cat, min(b.valor_liv) as 'valor minimo'
from categoriaipi a inner join livroipi b
on a.codigo_cat = b.codigo_cat
group by a.descricao_cat


select *
from vMax_categoriaipi a inner join vMin_categoriaipi b
on a.descricao_cat = b.descricao_cat

/*6. Marque V ou F
( F ) Atualização através de uma view pode afetar mais de uma tabela.
( V ) Views não podem ser alteradas. Devem ser eliminadas e recriadas.
( F ) Uma inserção através de uma view definida em uma única tabela pode ser
mapeada na tabela básica subjacente sem qualquer condição.
( F ) As visões definidas usando-se as funções de agrupamento e agregadas podem
ter valores totalizados atualizáveis. */


--17.04.23
drop table professoripi

CREATE TABLE professoripi
 (Id_prof int NOT NULL,
 Nome varchar(25) NOT NULL,
 Endereço varchar (10),
 idade smallint,
 constraint professor1 unique (nome),
 constraint professor2 primary key (Id_prof)
 );
 insert into professoripi
 values (1,'Marcos','Rua L',40);
 insert into professoripi
 values (2,'Jose','Rua L',50);
 insert into professoripi
 values (3,'Laura','Rua L',30);

 drop table disciplinaipi;

 CREATE TABLE disciplinaipi
 (Id_disc int NOT NULL,
 Nome varchar(25) NOT NULL,
 CH smallint not null,
 Id_prof int null ,
 constraint disciplina1 primary key (Id_disc) ,
 constraint disciplina2 FOREIGN KEY (Id_prof) references
 professor (Id_prof)
 );

 insert into disciplinaipi
 values (11,'Matematica',200,1);

 insert into disciplinaipi
 values (12,'Portugues',200,2);

 insert into disciplinaipi
 values (13,'Geografia',200,null);

 select * from disciplinaipi

 --DECLARAÇÃO DE VARIÁVEIS LOCAIS (@)
 /*DECLARE - Declaração de variáveis locais. São declaradas no corpo de um lote ou
procedimento.
• Atribuição com SELECT/SET - valores são atribuídos com uma instrução SET ou SELECT.
• Depois da declaração, todas as variáveis são inicializadas como NULL, a menos que um
valor seja fornecido como parte da declaração.
• Os nomes de variáveis devem começar com uma arroba (@).*/
DECLARE @vch smallint
SELECT @vch = 200
SELECT * FROM disciplinaipi where ch = @vch;  
--ou
DECLARE @vch smallint
SET @vch = 200
SELECT @vch;
--ou
DECLARE @vch smallint = 100
SELECT @vch;
--------------

--a. Declare as variáveis nome varchar (20), nota decimal (4,2) e id int
declare @nome varchar(20), @nota decimal (4,2), @id int

--b. Atribua valores a essas variáveis
declare @nome varchar(20) = 'flavio', @nota decimal (4,2) = 6.2, @id int = 100

--c. Use uma variável local chamada @procura para recuperar os nomes dos professores que iniciam com a letra J.
declare @procura char(2)
SET @procura = 'J%';
SELECT nome from professoripi
WHERE nome LIKE @procura;

 --DECLARAÇÃO DE VARIÁVEIS GLOBAIS (variaveis de sistemas) (@@)
 /*Use sp_monitor para verificar o conteúdo das variáveis. (Exibe estatísticas sobre
Microsoft SQL Server ).
• Muito comum a variável @@ROWCOUNT que exibe o número de linhas afetadas
pela última query.*/

select count(*) from disciplinaipi; 
SELECT @@ROWCOUNT;  --@@ROWCOUNT conta o número de linhas que vem no resultado

--PRINT: exibe uma mensagem
print 'teste'

declare @var1 int, @var2 int, @total char(80)
Select @var1 = 100
Select @var2 = 2
set @total = 'O valor de ' + convert (char(3),@var1) + ' * '+ convert
(char(3),@var2) + ' = ' + convert (char(4), @var1 * @var2)
PRINT @total

--d. Atribua o número de professores a uma variável, e exiba o resultado com o print
declare @total int
SELECT @total = count(id_prof)
FROM professoripi
print @total


--CASE expressão
/*Procura por valores equivalentes – a expressão é comparada com cada expressão do
WHEN (expressão 1, expressão 2...). Se iguais, retorna a expressão 10, 20....., caso
contrário a expressão do ELSE*/
SELECT ch =
CASE id_disc
WHEN 11 THEN 1000
WHEN 12 THEN 2000
ELSE 3000  --opcional (Caso o valor não seja igual ao de cima E se caso não tenha ELSE, o valor ficará como NULL)
END,
Id_disc, nome
From disciplinaipi

SELECT Id_disc, nome,
CASE
WHEN ch in (100,200) THEN 'ch 100 ou 200'
WHEN ch > 200 THEN 'ch maior que 200'
WHEN ch < 100 THEN 'ch menor que 100'
ELSE 'outro valor'
END ch
From disciplinaipi

/*e. Classificar, em ordem crescente, a identificação dos professores, se o número total de
professores for maior que 4, caso contrário, classificar pela idade.*/
SELECT id_prof, idade
FROM professoripi
ORDER BY CASE when (select count(*) from professor) > 4 THEN id_prof
 ELSE idade END

 --IF ELSE 
IF EXISTS (SELECT * FROM disciplinaipi )
PRINT 'Há disciplina'
ELSE PRINT 'Não á disciplina';

IF (SELECT sum(ch) FROM DISCIPLINA ) < 300
PRINT 'Carga horaria total menor que 300'
ELSE PRINT 'Carga horaria total maior ou igual a 300 ';

--BEGIN .. END      (seria as chaves do IF) Inclui uma série de comandos para serem tratados como uma unidade
IF EXISTS (SELECT * FROM DISCIPLINA where id_disc = 1 )
BEGIN --{ --agrupa os comando abaixo:
 DELETE FROM DISCIPLINA WHERE id_disc = 1
 PRINT 'disciplina encontrada e excluída'
END --}
ELSE PRINT 'disciplina não encontrada ';

/*f. Se houver disciplina sem professor, atualize a CH para 4 de todas as disciplinas que sejam
lecionadas apenas pelo professor mais velho.*/
declare @maxidade int
IF EXISTS (SELECT * FROM disciplinaipi where id_prof is null )
BEGIN --{
 Select @maxidade = (select max(idade) from professoripi);
 update disciplinaipi set ch = 4
 from disciplinaipi inner join professoripi
 on professoripi.id_prof = disciplinaipi.id_prof
 where professoripi.idade = @maxidade
END --}
ELSE PRINT 'disciplina sem professor não encontrada ';
select * from disciplinaipi;
select * from professoripi;

/*g. Se houver mais de 2 professore, exiba duas mensagens baseadas no total de
professores nas faixas de idade 20 e 30; e 31 a 60. Caso contrário exiba
mensagem 'O total de professores é menor ou igual a 2'*/
DECLARE @total1 INT, @total2 INT
IF
 (SELECT COUNT(*) FROM professor) > 2
BEGIN
 SET @total1 =
 (SELECT COUNT(*)
 FROM professor
 WHERE idade between 20 and 30);
 SET @total2 =
 (SELECT count(*)
 FROM professor
 WHERE idade between 31 and 60)
 PRINT 'Há ' + CAST(@total1 AS VARCHAR(3)) + ' professore(s) com idade entre 20
e 30';
 PRINT 'Há ' + CAST(@total2 AS VARCHAR(3)) + ' professore(s) com idade entre 31
e 60';
END
ELSE
 PRINT 'O total de professores é menor ou igual a 2';

/*WHILE ... BREAK ... CONTINUE     Comando de repetição até que a condição seja verdadeira
WHILE Boolean Expression
 [Comandos SQL]
 [BREAK]
 [Comandos SQL]
 [CONTINUE]
 [Comandos SQL]*/
create table teste (col1 int, col2 int);
delete from teste;
declare @var1 int
set @var1 = 1
while @var1 < 51
begin
 insert into teste values (@var1, @var1 * 10)
set @var1 = @var1 + 1
if (select sum(col2) from teste) < 4000
begin
 print 'soma de col2 < 4000'
 continue
end
else
begin
 print 'soma de col2 >= 4000'
 break
end
end
select sum(col2) from teste;



--exercicios
--1. Se o valor do livro for maior que X então escreva CARO, caso contrário escreva BARATO.
SELECT resultado =
CASE 
WHEN valor_liv > 100 THEN 'CARO'
ELSE 'BARATO' 
END,
valor_liv
From livroipi

--2. Atualizar barato = 100%  Caro = 50%
SELECT resultado =
CASE 
WHEN valor_liv > 100 THEN valor_liv * 0.50
ELSE valor_liv * valor_liv
END,
valor_liv
From livroipi

--3. Se o preço médio dos livros for maior que 30, imprima "Média dos preços maior que 30",
--caso contrário imprima "média dos preços menor ou igual a 30"
IF
(SELECT AVG(valor_liv) FROM livroipi) > 30
PRINT 'Média dos preços maior que 30.'
ELSE PRINT 'média dos preços menor ou igual a 30.'

/*4. Criar uma tabela cliente1 semelhante a cliente.
	 Popular com 30 linhas usando um procedimento;
	 Criar uma tabela compra1 usando compra;
	 Popular com 20 linhas a tabela compra usando um procedimento.
*/

drop table clienteipi2
drop table pedidoipi2
select * into clienteipi2 from clienteipi
select * into pedidoipi2 from pedidoipi

declare @var1 int, @cpf bigint
set @var1 = 1
set @cpf = 11111111111
while @var1 < 20
begin
	insert into pedidoipi2 values (@var1,'2018-01-01', 11111111111, 20.0);
	insert into clienteipi2 values (@cpf,'Cliente' + CAST(@var1 AS VARCHAR(3)), 'cliente' + CAST(@var1 AS VARCHAR(3)) +'.@gmail.com','F','2000-01-01');
set @var1 = @var1 + 1
set @cpf = @cpf + 1
end

select * from pedidoipi2
select * from clienteipi2

--24.04.23
--criar as tabelas de marketing - modelo marketing
--1.Popular as dimensões 
drop table clientemipi
drop table satisfacaomipi

create table clientemipi
(      
cpf_cli decimal(11,0) not null, 
estado_cli varchar(30) not null, 
cidade_cli varchar(30) not null, 
rendamensal_cli decimal (6,2) null,
constraint cli1 primary key (cpf_cli)
);

create table satisfacaomipi
(      
codigo_sat int not null,
cpf_cli decimal(11,0) not null, 
nota_atendimento int null,
nota_limpeza int null,
nota_livros int null
constraint satis1 primary key (codigo_sat),
constraint satis2 FOREIGN KEY (cpf_cli) references
 clientemipi(cpf_cli)
);

declare @var1 int, @cpf bigint
set @var1 = 1
set @cpf = 11111111111
while @var1 < 20
begin
	insert into clientemipi values (@cpf,'São Paulo','São Paulo', 2000.0);
	insert into satisfacaomipi values (@var1, @cpf, 8,8,8);
set @var1 = @var1 + 1
set @cpf = @cpf + 1
end

select * from clientemipi
select * from satisfacaomipi

--08.05.23
--2. Criar e Popular as dimensões (livro cliente) e a tabela fato.
drop table livromipi
drop table clientemipi2
drop table fatomipi
drop table datamipi3

create table livromipi
(      
SK_liv int IDENTITY(1,1) primary key not null, 
data_exclusao datetime,
data_inclusao datetime, 
nome_liv varchar(30) default 'ausente', 
valor_liv decimal (5,2)  default 99.99,
codigo_cat tinyint  default 99,
descricao_cat varchar(30) 
);

create table clientemipi2
(      
SK_cli int IDENTITY(1,1) primary key not null, 
data_exclusao datetime,
data_inclusao datetime not null,
notasatisfacao int ,
renda_cli  int,
cpf_cli decimal(11,0) not null, 
estado_cli varchar(30) not null, 
cidade_cli varchar(30) not null
);

create table datamipi3
(      
SK_dt int IDENTITY(1,1) primary key not null, 
ano_dt int not null,
mes_dt int not null,
dia_dt int not null
);

create table fatomipi
(    
quantidade int not null, 
valorvenda decimal (6,2) null,
SK_liv int  null,
SK_cli int  null,
SK_dt int null
constraint sk1 foreign key (SK_liv) references livromipi (SK_liv),
constraint sk2 foreign key (SK_cli) references clientemipi2 (SK_cli),
constraint sk3 foreign key (SK_dt) references datamipi3 (SK_dt)
);


--Popular dimensão livromipi
insert into livromipi(data_exclusao, data_inclusao, nome_liv, valor_liv, codigo_cat, descricao_cat)
select null, GETDATE(), b.nome_liv, b.valor_liv, a.codigo_cat, a.descricao_cat
from categoriaipi a full outer join livroipi b
on a.codigo_cat = b.codigo_cat

--Popular dimensão clientemipi2
insert into clientemipi2 
           (data_exclusao, data_inclusao, notasatisfacao, renda_cli, cpf_cli, estado_cli,cidade_cli)
select null, GETDATE(), (b.nota_atendimento + b.nota_limpeza + b.nota_livros)/3 , (a.rendamensal_cli * 12), a.cpf_cli, a.estado_cli, a.cidade_cli
from clientemipi a full outer join satisfacaomipi b
on a.cpf_cli = b.cpf_cli


--Popular dimensão datamipi3
DECLARE @mindata datetime, @maxdata datetime
select @mindata = MIN(data_ped) from pedidoipi
select @maxdata = MAX(data_ped) from pedidoipi

while @mindata <= @maxdata
begin
	select @mindata =  DATEADD(DD,1,@mindata)
	insert into datamipi3 (ano_dt, mes_dt, dia_dt) values (year(@mindata),month(@mindata),day(@mindata))
end

--Popular dimensão fatomipi
---Desabilitar a restrição de chave estrangeira
ALTER TABLE fatomipi NOCHECK CONSTRAINT sk3;

insert into fatomipi (quantidade, valorvenda, SK_liv, SK_cli, SK_dt)
select c.quantidade_pos, d.valor_liv, f.SK_liv, e.SK_cli, h.SK_dt
from clienteipi a inner join pedidoipi b
on a.cpf_cli = b.cpf_cli
inner join possuiipi c on b.codigo_ped = c.codigo_ped
inner join livroipi d on c.codigo_liv  = d.codigo_liv
inner join clientemipi2 e on a.cpf_cli = e.cpf_cli
inner join livromipi f on f.codigo_cat = d.codigo_cat
inner join clientemipi2 g on g.cpf_cli = e.cpf_cli
cross join (select * from datamipi3) h

---Reativar a restrição de chave estrangeira
ALTER TABLE fatomipi CHECK CONSTRAINT sk3;

--29.05.23
--Exemplo 1
use teste

drop table disciplina22;

create table disciplina22
(id_disc int not null,
nome varchar(30),
ch int
)
insert into disciplina22
values (11,'Matematica',200)
insert into disciplina22
values (12,'Portugues',100)
insert into disciplina22
values (13,'Historia',150)

select * from disciplina22

--Criar o trigger e testar
/*Msg 50000, Nível 16, Estado 10, Procedimento atencao, Linha 4 [Linha de Início do
Lote 26]
Atencao - modificação na tabela disciplina!*/
CREATE TRIGGER atencao
ON disciplina22
AFTER INSERT, UPDATE
AS RAISERROR ('Atencao – modificação na tabela disciplina!', 16, 10);
GO
insert into disciplina22
values (17,'Java',150)

select * from disciplina22
delete from disciplina22 where id_disc = 17

--Exibir o conteúdo do trigger
exec sp_helptext 'atencao'

--Eliminando o gatilho
drop trigger atencao

--Desativando o gatilho
DISABLE TRIGGER atencao ON disciplina22;

--Ativando o gatilho
ENABLE Trigger atencao ON disciplina22;

--Exclusão do trigger
drop trigger atencao

--exemplo 2  AFTER faz com que o disparo se dê somente após a ação que o gerou ser concluída. 
CREATE TRIGGER verificaafter
ON disciplina22
AFTER INSERT, UPDATE
AS RAISERROR ('Não é possível tal alteração', 16, 10);
GO
insert into disciplina22
values (15,'Java',150)

--exemplo 3   INSTEAD OF faz com que o trigger seja executado no lugar da ação que o gerou.
CREATE TRIGGER verificainsteadof
ON disciplina22
instead OF INSERT, UPDATE
AS RAISERROR ('Não é possível tal alteração', 16, 10);
GO
insert into disciplina22
values (15,'Java',150)

--Operação de INSERT:  --Inserted é uma tabela lógica que contém uma cópia da(s) linha(s) que será(ão) incluída(s).CREATE TRIGGER verificainserted2
ON disciplina22
AFTER INSERT
AS
 select * from inserted
GO
insert into disciplina22
values (17,'Java',150)

--Operação de DELETE
CREATE TRIGGER verificadeleted
ON disciplina22
AFTER DELETE
AS
 select * from deleted
GO
insert into disciplina22
values (17,'Java',150)

--Operação de UPDATECREATE TRIGGER verificaupdate
ON disciplina22
AFTER UPDATE
AS
 select * from deleted
select * from inserted
GO
insert into disciplina22
values (17,'Java',150)
update disciplina22 set nome = 'C'
where id_disc=17

/*exemplo 7- regra de negócio */
drop table ordem_compra
drop table fornecedor

create table fornecedor
(id_for int primary key,
nome_for varchar(30),
nota_for int)

create table ordem_compra
(id_ord int,
data_ord varchar(30),
id_for int references fornecedor (id_for) )

insert into fornecedor values (1,'ricardo',4)
insert into fornecedor values (2,'ricardo',5)


CREATE TRIGGER regradenegocio
ON ordem_compra
AFTER INSERT
AS
 IF EXISTS (select a.nota_for
 from inserted b
inner join fornecedor a
on a.id_for = b.id_for
where a.nota_for = 5)
BEGIN
 print ('fornecedor sem credito');
 ROLLBACK TRANSACTION;
 RETURN
 END;

--Primeira inclusão ocorre
insert into ordem_compra values (10,'2020/1/1',1)
--Segunda inclusão não ocorre: a transação foi encerrada no gatilho. O lote foi anulado porque a nota é 5 (regra que está no trigger)insert into ordem_compra values (20,'2020/1/1',2)--EXEMPLO: EXERCÍCIO 1---Criar a tabela sala (Id_sala,Nome,Nu_carteiras, Situacao). Inserir valores.
CREATE DATABASE teste
use teste

drop table dbo.sala;

 CREATE TABLE dbo.sala
 (Id_sala int NOT NULL,
 Nome varchar(25) NOT NULL,
 Nu_carteiras smallint not null,
 Situacao char (1) not null,
 constraint sala1 primary key (Id_sala)
 )
 insert into dbo.sala
 values (100,'Sala A', 20, 'O' );
 insert into dbo.sala
 values (200,'Sala B', 50, 'O');
 insert into dbo.sala
 values (300,'Sala C', 10, 'D');
 select * from dbo.sala;

---Criar a tabela disciplina(Id_disc,Nome,CH). Inserir os valores:
 drop table dbo.disciplina;

 CREATE TABLE dbo.disciplina
 (Id_disc int NOT NULL,
 Nome varchar(25) NOT NULL,
 CH smallint not null
 constraint disc1 primary key (Id_disc)
 );
 insert into dbo.disciplina
 values (11,'Matematica',200);
 select * from dbo.disciplina;

 insert into dbo.disciplina
 values (12,'Portugues',100);
 select * from dbo.disciplina;

---Criar uma trigger para insert, delete e update em disciplina
---para exibir as tabelas inserted, deleted e updated. Depois
---excluir os 3 triggers.
CREATE TRIGGER disciplina_insert
ON disciplina
FOR INSERT
AS
BEGIN
 select * from inserted
END
Insert into disciplina values (16,'disciplina',30)

CREATE TRIGGER disciplina_update
ON disciplina
FOR update
AS
BEGIN
 select * from inserted;
 select * from deleted;
END
update disciplina set nome='outra' where id_disc = 16

CREATE TRIGGER disciplina_delete
ON disciplina
FOR delete
AS
BEGIN
 select * from deleted;
END
delete from disciplina where id_disc = 16

---Criar a tabela sala-disciplina (Id_sala, Id_disc). Inserir os valores:drop table dbo.sala_disciplina

 CREATE TABLE dbo.sala_disciplina
 ( Id_sala int NOT NULL,
 Id_disc int not null,
 constraint sd1 FOREIGN KEY (Id_disc)
 references disciplina (id_disc) ,
 constraint sd2 FOREIGN KEY (Id_sala)
 references sala (id_sala) ,
 constraint sd3 primary key (Id_disc, Id_sala)
 );
 insert into sala_disciplina
 values (100,11);
 insert into sala_disciplina
 values (200,12);---Crie um gatilho tal que ao atualizar sala-disciplina, atualiza a
---situação da sala: ‘D’-desocupada, ‘O’-desocupada.CREATE TRIGGER sala_disciplina_gatilho
ON sala_disciplina
FOR UPDATE
AS
BEGIN
 UPDATE sala SET situacao = 'O'
 From sala, inserted where sala.id_sala = inserted.id_sala;
 UPDATE sala SET situacao = 'D'
 From sala, deleted
 where sala.id_sala = deleted.id_sala
END---Atualize a tabela sala-disciplina: mude a sala de 100 (Sala A)
---para 300 (Sala C), da disciplina 11(Matemática). Ao fazer essa
---atualização, o gatilho deve ser disparado, alterando a situação
---da sala 300 para ‘O’ e da sala 100 para ‘D’.Update Sala_Disciplina
 Set id_sala = 300
 Where id_sala = 100select * from Sala_Disciplina---Atualize a tabela sala-disciplina: mude a sala de 200 para 100,
---da disciplina 12. Ao fazer essa atualização, o gatilho deve será
---disparado, alterando a situação da sala 200 para ‘D’ e da sala
---100 para ‘O’. Update Sala_Disciplina
 Set id_sala = 100
 Where id_sala = 200 select * from Sala_Disciplina--EXEMPLO: EXERCÍCIO 2--- Dada a tabela funcionário (id_func, nome, idade,
---data_inserção). Criar uma log dessa tabela, ou seja, um histórico das
---linhas excluídas dessa tabela.drop table funcionariodrop table funcionario_logdrop trigger funcionario_deleteCREATE TABLE dbo.funcionario
 (Id_func int NOT NULL,
 Nome varchar(25) NOT NULL,
 idade smallint not null,
data_insercao datetime not null,
 constraint func1 primary key (Id_func)
 );

 insert into dbo.funcionario
 values (11,'Jose',25, '2018-01-01');
 insert into dbo.funcionario
 values (12,'Marcos',30, '2018-12-01');
---cria a tabela de log:
 CREATE TABLE dbo.funcionario_log
 (Id_func int NOT NULL,
 Nome varchar(25) NOT NULL,
 idade smallint not null,
data_insercao datetime not null
 );
 ---Cria o triggercreate trigger funcionario_delete
on funcionario
for delete
as
BEGIN
 insert into funcionario_log select * from deleted
END


delete from funcionario
where id_func=11

select * from funcionarioselect * from funcionario_log




--exercicio 29.05.23
--1. crie um trigger para uma tabela do projeto
create table clienteipi22
(
cpf_cli decimal(11,0) not null, 
nome_cli varchar(30) not null, 
email_cli varchar(30) null,
)

CREATE TRIGGER atencao33
ON clienteipi22
AFTER INSERT, UPDATE
AS RAISERROR ('Atencao – modificação na tabela disciplina!', 16, 10);
GO
insert into clienteipi22 values (11111111111,'Rosa Goncalves', 'rosa.G@gmail.com');


--2. Exibir o conteúdo do trigger elaborado no exercício anterior
exec sp_helptext 'atencao33'

--3. Qual a diferença do INSTEADOF   e   AFTER usado no trigger
AFTER faz com que o disparo se dê somente após a ação que o gerou ser concluída. 
INSTEAD OF faz com que o trigger seja executado no lugar da ação que o gerou.

--4. Mostre o conteúdo da inserted.
CREATE TRIGGER verificainserted33
ON clienteipi22
AFTER INSERT
AS
 select * from inserted
GO
insert into clienteipi22 values (11111111111,'Rosa Goncalves', 'rosa.G@gmail.com');

--5. Mostre o conteúdo do deleted.
CREATE TRIGGER show_deleted
ON clienteipi22
AFTER DELETE
AS
      SELECT * FROM deleted
GO
DELETE FROM clienteipi22 WHERE cpf_cli=11111111111;

--6. Mostre o conteúdo do UPDATE.CREATE TRIGGER verificaupdate
ON clienteipi22
AFTER UPDATE
AS
 select * from deleted
select * from inserted
GO
insert into clienteipi22 values (11111111111,'Rosa Goncalves', 'rosa.G@gmail.com');
update clienteipi22 set nome_cli = 'C'
where cpf_cli=11111111111

--7. Atividade extra
--7.1 Criar uma tabela livroipi2000 semelhante a tabela livropi, e incluir a coluna
--quantidade (qtde). Atualize a quantidade com valor 10 para todos os livros.
select * into livroipi2000 from livroipi
alter table livroipi2000 add 
            qtde int null;

declare @var1 int
set @var1 = 1
while @var1 < 6
begin
	update livroipi2000 set qtde = 10 where codigo_cat= @var1
set @var1 = @var1 + 1
end

select * from livroipi2000

--7.2 Criar uma tabela pedidoipi2000 semelhante a tabela pedidoipiselect * into pedidoipi2000 from pedidoipi

--7.3-Criar uma tabela possuiipi2000 semelhante a tabela possuiipi. Excluir todas as
--linhas de possuiipi2000.select * into possuiipi2000 from possuiipi

DELETE FROM possuiipi2000


--7.4-Criar um trigger que atualize a quantidade do livroipi2000 ao ocorrer uma
--inclusão em possuiipi2000.
CREATE TRIGGER verificaupdate
ON livroipi2000
AFTER UPDATE
AS
 select * from deleted
select * from inserted
GO
insert into possuiipi2000
values (2000,1000, 1)
update livroipi2000 set qtde = 11
where codigo_liv=2000

--7.5-Incluir as linhas a seguir em possuiipi2000
/*10000, 1000, 1
 20000, 1000, 1
 20000, 2000, 1*/
insert into possuiipi2000 values (10000,1000, 1);
insert into possuiipi2000 values (20000,1000, 1);
insert into possuiipi2000 values (20000,2000, 1);

select * from possuiipi2000
select * from livroipi2000

--7.6- Criar uma tabela de log possuiipi2000log, semelhante a tabela possuiipi2000
--(log de exclusão de linha de possuiipi2000). Exclua todos os valores dessa tabela
--de log.select * into possuiipi2000log from possuiipi2000

DELETE FROM possuiipi2000logselect * from possuiipi2000log--7.7- Criar um trigger para exclusão em possuiipi2000, que inclui a linha excluída
--de possuiipi2000 em possuiipi2000log.
--7.8- Exclua a linha de possuiipi2000 para codliv = 2000 e verifique a tabela
--possuiipi2000log.create trigger possui_delete
on possuiipi2000
for delete
as
BEGIN
 insert into possuiipi2000log select * from deleted
END


delete from possuiipi2000
where codigo_liv = 2000

select * from possuiipi2000select * from possuiipi2000logdrop trigger possui_delete
--7.9- Criar um trigger para UPDATE em possuiipi2000. Quando uma quantidade for
--atualizada em possuiipi2000, atualizar qte em livroipi2000, tal que:
--Soma o valor antigo e diminui o novo valor. (caso de uma linha sendo alterada).
CREATE TRIGGER atualiza_quantidade
ON possuiipi2000
AFTER UPDATE
AS
BEGIN
    UPDATE livroipi2000
    SET qtde = livroipi2000.qtde + (deleted.quantidade_pos - inserted.quantidade_pos)
    FROM livroipi2000
    INNER JOIN deleted ON livroipi2000.codigo_liv = deleted.codigo_liv
    INNER JOIN inserted ON livroipi2000.codigo_liv = inserted.codigo_liv;
END

--7.10- Teste o trigger. Atualize a tabela possuiipi2000: atualizar a quantidade 
--para 2 do livro 1000 e código do pedido 10000.
--Mostre os novos valores de posssuiipi2000 e livroipi2000.
UPDATE possuiipi2000
SET quantidade_pos = 2
WHERE codigo_liv = 1000 AND codigo_ped = 10000;

SELECT * FROM possuiipi2000;
SELECT * FROM livroipi2000;
