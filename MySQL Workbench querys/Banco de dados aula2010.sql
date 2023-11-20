-- criar banco:

create database aula;

-- selecionar banco:
 
use aula;

-- criar tabela:

create table teste(
id int(4) zerofill primary key auto_increment,
 nome varchar(30),
 pais char(3) default 'BRA',
 sexo char(1) check(sexo in ('m','f')));
 
 -- verificar estrutura da tabela:
 
 desc teste;
 
 -- inserir dados na tabela:
 
 insert into teste values (null,'fulano','','m'), (null,'beltrana',null,'f');
 insert into teste (nome,sexo) values ('fulano','m');
 
 -- apagar chave primária:
 
 alter table teste modify column id int(4) zerofill; 
 alter table teste drop primary key;
 alter table teste add primary key(id);
 
 -- criando uma tabela com restrição de exclusão em cascata:
 
 create table curso(
 id int primary key auto_increment,
 sigla char(5));
 drop table aluno;
 create table aluno(
 id int primary key auto_increment,
 id_c int,
 nome varchar(30),
 foreign key (id_c) references curso (id)
 on delete cascade
  );
 
 desc aluno;
 
 insert into curso values(1,'ads');
 insert into curso values(null,'ads'),(null,'dir'),(null,'agro');
 insert into aluno values (null,1,'fulano'),(null,2,'cicrano'),(null,3,'beltrano');
 
 -- selecionar todos os dados da tabela:
 
 select * from curso;
 select * from aluno;
 
 -- apagando a chave estrangeira:
 
  alter table aluno drop foreign key aluno_ibfk_1;
  
  -- verificando toda a estrutura e atributos da tabela:
  
  show create table aluno;
  
  -- deletando um registro da tabela:
  
  delete from curso where id = 1;
  
  -- desabilitando a chave estrangeira:
  
  set foreign_key_checks = 1;
  
  -- apagar todos os dados da tabela:
  
  truncate table curso;