/*
Comandos DDL - Data Definition Language
Criar databases ou tabelas
Excluir databases ou tabelas 
Alterar estrutura de databases ou tabelas

Create
Drop
Alter

Dicas de comandos:
ocultar/exibir barra de mensagens ap�s a execu��o da query: CTRL + R
executar query: bot�o executar ou F5
refresh(atualizar) no banco: F5
ir para a linha : CTRL + Ddd

Dicas gerais:
Caso n�o fa�a c�lculo com determinado n�mero, n�o usar INT, o campo pode ser CHAR/VARCHAR

Caso o campo seja obrigat�rio, informar que � NOT NULL. Ao contr�rio, pode informar que � NULL ou n�o colocar nada, pois o SQL j� entende que o campo � nulo, ou seja, n�o obrigat�rio.

Entendendo a diferen�a entre os tipos char e varchar

char com 10 posi��es
J O R G E
- - - - - - - - - -  tamanho fixo em disco
- - - - - - - - - - 
10 bytes

varchar com 10 posi��es
J O R G E
- - - - -			tamanho variav�l em disco
- - - - - - - - - - 
5 bytes
*/

use db_empresa -- acessando banco de dados

drop database db_empresa -- apagando banco de dados


create database db_hotel

use db_hotel

create table tbl_Cliente(
	cd_cli int primary key identity, --  int = ir� armazenar n�meros inteiros, primary key = chave prim�ria, n�o aceita valores nulos, � um registro �nico e n�o aceita valores repitidos, identity = autoincrimento, cadastro com n�mera��o autom�tica
	nm_cli varchar(50) not null, -- not null = obrigat�rio informar o nome
	sg_sexo char(1) not null check(sg_sexo in('M','F')), -- tipo de dado check = restri��es exclusivas e restri��es de verifica��o
	no_cpf char(11) not null,
	nm_cidade varchar(20)
)

create table tbl_Telefone(
	cd_telefone int primary key,
	no_ddd varchar(2),
	no_telefone varchar(9),
	cd_cli int foreign key references tbl_Cliente(cd_cli)
)

/*
Comandos DML - Data Manipulation Language
Manipular os dados da tabela

Insert
Update
Delete

*/

use db_hotel

insert into tbl_Cliente
(nm_cli,sg_sexo,no_cpf,nm_cidade)
values('Pablo Souza', 'M', '11122233304', 'Santos')

insert into tbl_Cliente
(nm_cli,sg_sexo,no_cpf,nm_cidade)
values('Milena Amaral', 'F', '22233344405', 'Campinas')

insert into tbl_Cliente
(nm_cli,sg_sexo,no_cpf,nm_cidade)
values('Vitor Lopes', 'M', '33344455506', 'S�o Paulo')

insert into tbl_Cliente -- insira na tabela cliente
(nm_cli,sg_sexo,no_cpf,nm_cidade) -- nos campos(...)
values('Kaua Lima', 'M', '44455566607', 'Brotas') -- os valores(...)

select * from tbl_Telefone
select * from tbl_Cliente

insert into tbl_Telefone
(cd_telefone,no_ddd,no_telefone,cd_cli)
values(1,'13','999887766',1) -- int n�o precisa ser setado entre aspas simples ' ' 

insert into tbl_Telefone
(cd_telefone,no_ddd,no_telefone,cd_cli)
values(2,'19','999776655',2)

insert into tbl_Telefone
(cd_telefone,no_ddd,no_telefone,cd_cli)
values(3,'11','999665544',3)

insert into tbl_Telefone
(cd_telefone,no_ddd,no_telefone,cd_cli)
values(4,'14','999554433',4)

insert into tbl_Telefone
(cd_telefone,no_ddd,no_telefone,cd_cli)
values(5,'14','999443322',4)

insert into tbl_Telefone
(cd_telefone,no_ddd,no_telefone,cd_cli)
values(6,'11','999332211',8), (7,'11','999221100',9), (8,'11','999110011',10)

/*
Comando DQL - Data Query Language
Selecionar os dados

Select
*/

select * from tbl_Cliente

insert into tbl_Cliente (nm_cli,sg_sexo,no_cpf,nm_cidade)
values ('Matheus Rocha', 'M', '55566677708', 'Vit�ria'), ('Carla Lima', 'F', '66677788809',	'S�o Jos� dos Campos'), ('Bruno Macedo', 'M', '66677788810', 'Sergipe')	

delete from tbl_Cliente -- excluindo da tabela cliente
where cd_cli = 5; -- onde o c�digo do cliente for 5

delete from tbl_Cliente -- excluindo da tabela cliente
where cd_cli in (6, 7) -- em massa / onde o c�digo do cliente for 6 e 7

insert into tbl_Cliente (nm_cli,sg_sexo,no_cpf,nm_cidade)
values ('Daniel Santos', 'M', '55566677708', 'Osasco'), ('Karla Silva', 'F', '66677788809',	'Carapicu�ba'), ('F�bio Augusto', 'M', '66677788810', 'Itu')	

update tbl_Cliente -- atualize na tabela cliente
set nm_cli = 'Carla Silva' -- coloque no campo nm_cli o valor
where cd_cli = 9;

update tbl_Cliente
set nm_cli = 'Mariana Cardoso', no_cpf = '77766655503', nm_cidade = 'Diadema'
where cd_cli = 9; 

-- Jun��o de Tabelas em um �nico Select

select * from tbl_Cliente
select * from tbl_Telefone

select
	tbl_Cliente.nm_cli,
	tbl_Telefone.no_ddd,
	tbl_Telefone.no_telefone,
	tbl_Cliente.nm_cidade
from tbl_Cliente, tbl_Telefone
where tbl_Cliente.cd_cli = tbl_Telefone.cd_cli

insert into tbl_Cliente (nm_cli,sg_sexo,no_cpf,nm_cidade)
values('Maria Brasil', 'F', '55584074154','Pedreira')