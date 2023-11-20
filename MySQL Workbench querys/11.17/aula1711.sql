-- aula 17/11/2023 database escola:

-- ordenando os dados por ordem crescente de data de nascimento:
select * from aluno order by nascimento;

-- ordenando os dados por ordem decrescente de data de nascimento:
select * from aluno order by nascimento desc;

-- selecionando a data de nascimento do aluno mais velho:
select nome, min(nascimento) from aluno;

-- selecionando a data de nascimento do aluno mais novo (o campo nome, não retornará o esperado:
select nome, max(nascimento) from aluno;

-- extraindo a data de um campo:
select date(curdate());

-- retornando a idade, através da coluna nascimento, utilizando a função datediff(retorna o valor em dias),
-- a função datediff, recebe 02 parâmetros (data atual e data de nascimento, nessa ordem):
select nome,round(datediff(curdate(),nascimento)/365) from aluno  where nome = 'ana';
 
 -- retornando a idade, através da coluna nascimento, utilizando a função period_diff (retorna o valor em meses),
 -- a função period_diff, recebe 02 parâmetros (data atual e data de nascimento, nessa ordem),
  select nome, period_diff('202311','197201')/12 from aluno  where nome = 'ana';
  
  -- formatando a data. A função recebe 02 parâmetros (data e formato de saída):
  select date_format(curdate(),'%Y-%m-%d') as data;
  select date_format(curdate(),'%y-%m-%d') as data;
  select date_format(curdate(),'%Y-%M-%d') as data;
  select date_format(curdate(),'%Y-%m-%D') as data;
 
 -- a função period_diff, utiliza somente o ano e o mês, sem espaços, sendo assim, precisa ser formatada:
 select nome, period_diff(date_format(curdate(),'%Y%m'), date_format(nascimento,'%Y%m'))/12 from aluno  where nome = 'ana';
 
 -- retornando a idade, através da coluna nascimento, utilizando a função timestampdiff,
 -- essa função recebe 03 parâmetros (campo da data que deseja obter, data de nascimento, data atual:  
 select nome ,timestampdiff(year,nascimento,curdate())from aluno  where nome = 'ana';
 
 -- agrupando dados que se repentem:
 select area from curso;
 select area from curso group by area;
 
-- selecionando os cursos que tem duração menor que 100 horas:
 select area,ch from curso group by area where ch < 100 ;
 
 -- quando utilizamos group by, o operador where, não pode ser utilizado, sendo substituído pelo having:  
 select area,ch from curso group by area having ch < 100 ;
  
 -- selecionando os cursos que ainda não iniciaram:
 select nome, inicio from curso where inicio > curdate();
  
  -- selecionando os cursos já iniciados:
  select nome, inicio from curso where inicio < curdate();
  
  -- adicionando intervalos entre datas (data para boletos parcelados). o operador 'as' cria um allias para a coluna:
  select date_add(curdate(),interval 30 day) as '30 dias',date_add(curdate(),interval 60 day) as '30 dias';
  
  -- executando uma consulta entre três tabelas, utilizando a referencialidade entre PK e FK:
  select m.matricula, a.nome, c.nome from aluno a join matricula m on a.id = m.id_a join curso c on c.id = m.id_c;
  
  -- executando uma consulta entre duas tabelas, utilizando a referencialidade entre PK e FK e a condicional where:
  select a.nome , sum(m.valor) as total from aluno a join matricula m on a.id = m.id_a where nome = 'ana';


