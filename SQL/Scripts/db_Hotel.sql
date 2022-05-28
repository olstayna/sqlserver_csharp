/*
Comandos DDL - Data Definition Language
Criar databases ou tabelas
Excluir databases ou tabelas 
Alterar estrutura de databases ou tabelas

Create
Drop
Alter

Dicas de comandos:
ocultar/exibir barra de mensagens após a execução da query: CTRL + R
executar query: botão executar ou F5
refresh(atualizar) no banco: F5
ir para a linha : CTRL + Ddd

Dicas gerais:
Caso não faça cálculo com determinado número, não usar INT, o campo pode ser CHAR/VARCHAR

Caso o campo seja obrigatório, informar que é NOT NULL. Ao contrário, pode informar que é NULL ou não colocar nada, pois o SQL já entende que o campo é nulo, ou seja, não obrigatório.

Entendendo a diferença entre os tipos char e varchar

char com 10 posições
J O R G E
- - - - - - - - - -  tamanho fixo em disco
- - - - - - - - - - 
10 bytes

varchar com 10 posições
J O R G E
- - - - -			tamanho variavél em disco
- - - - - - - - - - 
5 bytes
*/

use db_empresa -- acessando banco de dados

drop database db_empresa -- apagando banco de dados


create database db_hotel

use db_hotel

create table tbl_Cliente(
	cd_cli int primary key identity, --  int = irá armazenar números inteiros, primary key = chave primária, não aceita valores nulos, é um registro único e não aceita valores repitidos, identity = autoincrimento, cadastro com númeração automática
	nm_cli varchar(50) not null, -- not null = obrigatório informar o nome
	sg_sexo char(1) not null check(sg_sexo in('M','F')), -- tipo de dado check = restrições exclusivas e restrições de verificação
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
values('Vitor Lopes', 'M', '33344455506', 'São Paulo')

insert into tbl_Cliente -- insira na tabela cliente
(nm_cli,sg_sexo,no_cpf,nm_cidade) -- nos campos(...)
values('Kaua Lima', 'M', '44455566607', 'Brotas') -- os valores(...)

select * from tbl_Telefone
select * from tbl_Cliente

insert into tbl_Telefone
(cd_telefone,no_ddd,no_telefone,cd_cli)
values(1,'13','999887766',1) -- int não precisa ser setado entre aspas simples ' ' 

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
values ('Matheus Rocha', 'M', '55566677708', 'Vitória'), ('Carla Lima', 'F', '66677788809',	'São José dos Campos'), ('Bruno Macedo', 'M', '66677788810', 'Sergipe')	

delete from tbl_Cliente -- excluindo da tabela cliente
where cd_cli = 5; -- onde o código do cliente for 5

delete from tbl_Cliente -- excluindo da tabela cliente
where cd_cli in (6, 7) -- em massa / onde o código do cliente for 6 e 7

insert into tbl_Cliente (nm_cli,sg_sexo,no_cpf,nm_cidade)
values ('Daniel Santos', 'M', '55566677708', 'Osasco'), ('Karla Silva', 'F', '66677788809',	'Carapicuíba'), ('Fábio Augusto', 'M', '66677788810', 'Itu')	

update tbl_Cliente -- atualize na tabela cliente
set nm_cli = 'Carla Silva' -- coloque no campo nm_cli o valor
where cd_cli = 9;

update tbl_Cliente
set nm_cli = 'Mariana Cardoso', no_cpf = '77766655503', nm_cidade = 'Diadema'
where cd_cli = 9; 

-- Junção de Tabelas em um único Select

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