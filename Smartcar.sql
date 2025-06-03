create database Smartcar;
use Smartcar;

create table cliente(
Id_cliente int auto_increment primary key,                                                     
Nome Varchar (100) not null,
Email  Varchar (100) not null,
Senha Varchar(200)Unique not null
);

create table pedido(
Id_pedido int auto_increment primary key,
Id_cliente int,
Id_produto int,
Cep varchar(9)not null,
Endereco varchar(20),
Bairro varchar (50)not null,
Cidade varchar (50)not null,
Estado varchar (2)not null,
Telefone Varchar(20)not null
);

create table produto(
Id_produto int auto_increment primary key, 
Modelo varchar(250)not null,
Preco Decimal(10,4) not null,
Descricao Text not null,
caracteristicas Text not null
);

create table estoque(
Id_estoque int auto_increment primary key,
Id_produto int,
Quantidade int(11) not null,
Quantidade_minima int(11) not null,
Quantidade_maxima int(11) not null
);

create table pagamento(
Id_pagamento int auto_increment primary key, 
Id_cliente  int,
Id_produto  int,
Forma_de_pagamento varchar(12),
Numero_do_cartao varchar(20),
Validade varchar(7),
Cvv varchar(3),
Data_prevista DATE,
Produto_selecionado varchar(30),
Quantidade int(5) not null,
Preco_final varchar(10)
);

/*  Criaçao de relacionamentos das tabelas*/

ALTER TABLE pedido
ADD CONSTRAINT `fk_pedido_pk_cliente`
FOREIGN KEY (`Id_cliente`)
REFERENCES cliente (`Id_cliente`);


ALTER TABLE pedido
ADD CONSTRAINT `fk_pedido_pk_produto`
FOREIGN KEY (`Id_produto`)
REFERENCES produto (`Id_produto`);


ALTER TABLE pagamento
ADD CONSTRAINT `fk_pagamento_pk_cliente`
FOREIGN KEY (`Id_cliente`)
REFERENCES cliente (`Id_cliente`);

ALTER TABLE pagamento
ADD CONSTRAINT `fk_pagamento_pk_produto`
FOREIGN KEY (`Id_produto`)
REFERENCES produto (`Id_produto`);

ALTER TABLE estoque
ADD CONSTRAINT `fk_estoque_pk_produto`
FOREIGN KEY (`Id_produto`)
REFERENCES produto (`Id_produto`);












