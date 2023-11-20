-- datas
select user();
select now();
select curdate();
select curtime();

-- operadores
create table oper(num int);
insert into oper values (15),(22),(40),(34),(46);
select count(*) from oper;
select min(num) from oper;
select max(num) from oper;
select sum(num) from oper;
select avg(num) from oper;
select round(avg(num),1) from oper;

create table teste1(
id int primary key auto_increment,
nome varchar(30));

create table teste2(
id int primary key auto_increment,
id_t int,
nome varchar(30),
foreign key (id_t) references teste1 (id));

create table teste11(
id int primary key auto_increment,
nome varchar(30));

create table teste22(
id int primary key auto_increment,
id_t int,
nome varchar(30));

create table teste111(
id int,
nome varchar(30));

create table teste222(
id int,
id_t int,
nome varchar(30));

insert into teste111 values (1,'teste111');
insert into teste222 values (2,1,'teste22');

-- consulta entre tabelas utilizando o union.
-- retorna somente valores distintos
select nome from teste22 union select nome from teste222;

-- retorna todos os valores
select nome from teste22 union all select nome from teste222;

-- retorna somente os valores iguais das duas tabelas
select nome from teste22 intersect select nome from teste222;

-- retorna os valores da primeira tabela que não estão na segunda tabela
select nome from teste22 except select nome from teste222;

