DROP DATABASE ID4;
create database ID4;
use ID4;

drop table produto;
drop table cliente;
drop table cesta;


CREATE TABLE produto(
    codigo_produto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    descritivo VARCHAR(250) NOT NULL,
    valor_produto DECIMAL(7,2) NOT NULL,
    destaque BOOLEAN,
    quantidade_produto INT NOT NULL,
    categoria VARCHAR(50) NOT NULL
);


create table cliente(
codigo_cliente int AUTO_INCREMENT NOT NULL,
nome varchar(100) NOT NULL,
email varchar(100) NOT NULL,
cpf varchar(20) NOT NULL,
cep varchar(10) NOT NULL,
endereco varchar(100) NOT NULL,
estado varchar(2) NOT NULL,
cidade varchar(30) NOT NULL,
numero int NOT NULL,
complemento varchar(30) NOT NULL,
telefone varchar(10) NOT NULL,
senha varchar(100) NOT NULL,    
primary key (codigo_cliente));

INSERT INTO cliente (nome, email, cpf, cep, endereco, estado, cidade, numero, complemento, telefone, senha)
VALUES ('Thiago', 'thiago@hotmail.com','47490086809', '02434000', 'Rua Daniel Vieira','SP', 'São Paulo', 207, 'Casa 4', '954562347','Test@1234');

INSERT INTO cliente (nome, email, cpf, cep, endereco, estado, cidade, numero, complemento, telefone, senha)
VALUES ('Jose', 'zezinho@hotmail.com','47490086802', '02434000', 'Rua Daniel Vieira','SP', 'São Paulo', 207, 'Casa 4', '954562347','Test@12345');

/*ver se coloca o  quantidade, valorUnitario  OU pegar da tabela PRODUTO*/
CREATE TABLE cesta(
    session_id int auto_increment not null,
    codigo_cliente int  not null,
    codigo_produto int  not null,
    primary key (session_id),
    constraint pk1_cesta foreign key(codigo_cliente) references cliente(codigo_cliente),
    constraint pk2_cesta foreign key(codigo_produto) references produto(codigo_produto)
);
select * from cesta;
select t2.titulo, t2.valor_produto, t2.quantidade_produto
				from cesta t1 inner join produto t2 
				on t1.codigo_produto = t2.codigo_produto where t1.codigo_cliente = 1;


select t2.titulo,COUNT(t2.titulo) as QTD, SUM(t2.valor_produto) as Valor, t2.quantidade_produto
				from cesta t1 inner join produto t2 
				on t1.codigo_produto = t2.codigo_produto where t1.codigo_cliente = 2;
                
select  distinct t2.titulo, COUNT(t2.titulo) AS quantidade, t2.quantidade_produto, t1.codigo_cliente
					from cesta t1 inner join produto t2 
						on t1.codigo_produto = t2.codigo_produto where t1.codigo_cliente = 1;
                
select * from cliente;
select * from produto;
select * from produto where destaque = 1;

INSERT INTO produto ( titulo , descritivo , valor_produto , destaque , quantidade_produto , categoria) 
VALUES ('Galaxy Z Flip','smartphone dobrável Samsung',6999.90, 1 ,1,'telefonia');

INSERT INTO produto ( titulo , descritivo , valor_produto , destaque , quantidade_produto , categoria) 
VALUES ('Zenfone','celular da Samsung',400.00, 1 ,1,'telefonia');

INSERT INTO produto ( titulo , descritivo , valor_produto , destaque , quantidade_produto , categoria) 
VALUES ('Samsung Adaptador','Um adaptador da Samsung',19.00, 0 ,1,'telefonia');

INSERT INTO produto ( titulo , descritivo , valor_produto , destaque , quantidade_produto , categoria) 
VALUES ('Samsung Carregador Turbo','carregador Samsung',119.19, 0 ,1,'telefonia');

INSERT INTO produto ( titulo , descritivo , valor_produto , destaque , quantidade_produto , categoria) 
VALUES ('Samsung Galaxy Buds2','fones da Samsung',1499.00, 0 ,1,'telefonia');