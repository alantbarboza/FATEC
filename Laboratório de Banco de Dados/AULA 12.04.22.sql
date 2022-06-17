
/*exercicios   -  aula  05/04/22*/
CREATE TABLE dbo.pessoa
 (Id int NOT NULL,
 Nome varchar(25) NOT NULL,
 endereço varchar (10),
 peso smallint ,
 dt_nascimento datetime
 );


 insert into dbo.pessoa
 values (1,'Maria','Rua Z',11, '2012/01/01' ) ;
 insert into dbo.pessoa
 values (2,'Jorge','Rua K',11, '2012/01/02' ) ;


/* query basica */
select * from pessoa 


/*inserir literal */
SELECT 'Identificação da pessoa: ', peso, nome FROM pessoa;

SELECT 'Este é o endereco da pessoa: ', endereço,
'Esta é a data de nascimento da pessoa: ', dt_nascimento FROM pessoa;

/* mudando o cabeçalho: Identificação , Pesopessoa e Nomepessoa são cabeçalhos */
SELECT Identificação = 'Identificação da pessoa: ', Pesopessoa =
peso, Nomepessoa = nome FROM PESSOA;

/*funções - números*/
SELECT FLOOR (123.45) AS FLOOR, CEILING (123.45) AS CEILING, ABS (-2)
as ABS, SIGN (-2) AS SIGNN, SIGN (2) AS SIGNP;

/*funções - Caracter*/
SELECT EX1 = nome + space (4) + endereço ,
EX2 = SUBSTRING (endereço,1,2), EX3 = UPPER (endereço),
EX4 = LOWER (endereço), EX5 = '2-' + LTRIM (' TURMA ') +
'2012',
EX6 = '2-' + RTRIM (' TURMA ') + '2012', EX7 = CHARINDEX ('ca',
'aaacaaaca') ,
EX8 = REPLICATE ('a', 7)
from PESSOA;



/*Mudando o cabeçalho*/
SELECT Identificação = 'Identificação da pessoa: ', Pesopessoa =
peso, Nomepessoa = nome FROM PESSOA;

drop table dbo.responsavel













/*exercicios   -  aula  12/04/22*/
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

 /*apagar tabela: drop responsavel*/

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
 
 /*literal: este é o preço xxx do material xxx*/
 select 'este é o preço',preco, 'do material', descricao
 from material

 /*literal: o material xxx tem a unidade de mensuração xx*/
 select 'o material ', descricao, 'tem a unidade de mensuração ', unidade_mensuracao
 from material

 /*trocando o nome das 4 colunas (isso é apenas na exibição)
 codigoM --- virou ---> CODIGO
 descricao ----virou ---> NOME
 */
 select codigoM as CODIGO,
        descricao as NOME,
        preco as VALOR,
        unidade_mensuracao as UNIDADE
 from material

 /*USANDO OUTRA NOTAÇÃO PARA trocar o nome das 4 colunas (isso é apenas na exibição)
 codigoM --- virou ---> CODIGO
 descricao ----virou ---> NOME
 */
 select CODIGO = codigoM,
        NOME = descricao,
        VALOR = preco,
        UNIDADE = unidade_mensuracao
 from material

  /*mudando o cabeçalho com o literal
     literal1     NOME      literal2       DATA_ADMISSAO
  o funcionario   xxx    foi admitido        xxx
 */
 select literal1 = 'O funcionario', nome as NOME,
 literal2 = 'foi admitido', data_admissao as DATA_ADMISSAO
 from responsavel

 /* usando Operadores Aritméticos:

 usando a tabela obra: 
  (numero int NOT NULL,
 endereco varchar(30) NULL,
 nome varchar(30)  NULL,
 id int not null,
 */
 select * from obra  /*liste todas as obras do database*/

 /*listar o numero da obra, o valor duplo do numero da obra, nome da obra
 inserir um cabeçalho para o novo valor como NOVOVALOR*/
select numero, NOVOVALOR = numero * 2 ,  nome
from obra

/*preco do material se eu reduzir pela metade*/
select NOVOPRECO = preco/2, descricao
from material

/*o preço reduzido pela metade VEZES 3*/
select NOVOPRECO = preco/2 * 3, descricao
from material

/*FUNÇÕES - NUMEROS*/
SELECT c1 = FLOOR (123.45),    /*sintaxe 1 para mudar o cabeçalho*/
c2 = CEILING (123.45), 
c3 = ABS (-2), 
c4 = SIGN (-2), 
c5 = SIGN (2);

SELECT FLOOR (123.45) as c1,   /*sintaxe 2 para mudar o cabeçalho*/
CEILING (123.45) as c2, 
ABS (-2) as c3, 
SIGN (-2) as c4, 
SIGN (2) as c5;

/*listar os valores dos precos do material arredondados para cima
com os seguintes cabeçalhos: precoCIMA, precoBAIXO, dobroPRECO
     literal1     NOME      literal2       DATA_ADMISSAO
    funcionario   xxx    foi admitido        xxx
*/
 select precoCIMA = CEILING(preco), FLOOR(preco) as precoBAIXO,
 dobroPRECO = preco * 2 
 from material


 /*tabela material tudo em maiusculo*/
select UPPER(descricao) from material

 /*o endereço da obra  e a 3,4,5 caracteres em letras minusculas*/
 select lower(substring(endereco,3,5)) from obra

 /*concatenar(ajuntar): obra + dois caracteres do nome da obra + 6 espaços + 3 caracteres de endereço + tem numero , numero
          nome    endereço:
 A obra + XX-     YYY tem numero      ,numero
 */
 select 'A obra ' + substring(nome,1,2) + space(6) + substring(endereco,1,3) + ' tem numero ',  numero
from obra

/*funções - datas
datepart(parte,data)    --retorna a parte da data

datepart   Abreviação    Valor
year        yy          1753-9999
quarter     qq          1-4
month       mm          1-12
Day of year dy          1-366
Day         dd          0-31
week day    dw          1-7
hour        hh          0-23
minute      mi          0-59
millisecond ms          0-999
second      ss          0-59

*/

select getdate() --pegue a data de hoje 
select datepart(dd, getdate())   --pegue apenas o dia
select datepart(mm, getdate())   --pegue apenas o mes
select datepart(dw, '2001/07/23') --pegue o dia da semana que eu nasci ( segunda )
select datediff(dd,'2001/07/23', '2022/04/12') --quantos dias tem entre uma data e outra
select datediff(yy,'2001/07/23', '2022/04/12') --quantos anos tem entre uma data e outra

/*a quantos dias o responsavel está alocado na empresa

 CREATE TABLE responsavel
 (id int not null,
 nome varchar(25) NULL,
 data_admissao datetime,
 constraint r1 primary key (id)
 );*/

 select datediff(dd, data_admissao, getdate())
from responsavel


 /*qual o dia da semana que ele foi admitido*/
 select datename(dw,data_admissao) from responsavel

/*somar:  4 dias + data de hoje*/
select dateadd(dd, 4, getdate())
from responsavel


/*qual é o dia do bonus dos meus funcionarios*/
select 'Sr.' + nome + space(2) +'você recebera ' , dateadd(yy,5,data_admissao) as bonus, '.Parabéns'
from responsavel


 /*exercicios da aula 05/04/22 - usando a mesma tabela RESPONSAVEL*/

/* Listar os nomes dos responsaveis, em letra maiuscula, cujo código pertence a lista
(xx,yy,zz), ordenados pelo nome. */

select * from responsavel; /*nome dos responsaveis*/

select upper(nome) from responsavel; /*em letra maiuscula*/

select upper(substring(nome,1,2)) + lower(substring(nome,3,4)) /*duas letras maiuscula + duas letras minusculas */
from responsavel;


/* Listar a descrição e o preço de cada material, acrescidos de 10%, atribuindo um
cabeçalho novovalor. */
SELECT 'a descrição do material é:' ,descricao , 'o preço do material é', preco, 'o novo valor é', preco + preco * 10/100 from material
+
--Localizar um padrao dentro de Nomes
SELECT Nome, PadraoNomes = CHARINDEX('ro',Nome) FROM responsavel

