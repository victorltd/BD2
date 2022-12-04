CREATE TABLE FUNCIONARIO(
	numero integer PRIMARY KEY,
	serie varchar(10) NOT NULL,
	nome varchar(50) unique,
	salario real
)

CREATE TABLE FUNCAO(
	PK_CODFUNCAO integer PRIMARY KEY,
	NOME_FUNCAO varchar(10),
	SALARIO real

)

CREATE TABLE FUNCIONARIO(
	PK_MATRICULA integer PRIMARY KEY,
	NOME_FUNCIONARIO varchar,
	FK_CODFUNCAO integer,
	CONSTRAINT FK_CODFUNCAO FOREIGN KEY(FK_CODFUNCAO)
	REFERENCES FUNCAO (PK_CODFUNCAO)

)

CREATE TABLE DEPARTAMENTO(
	PK_CODDEPARTAMENTO SERIAL PRIMARY KEY,
	NOME_DEPARTAMENTO VARCHAR
)


CREATE TABLE FUNCIONARIO_DEPARTAMENTO(
	PKFK_MATRICULA integer,
	PKFK_CODDEPARTAMENTO  SERIAL,
	CONSTRAINT FK_MATRICULA FOREIGN KEY(PKFK_MATRICULA) 
	REFERENCES FUNCIONARIO (PK_MATRICULA),
	CONSTRAINT FK_DEPT FOREIGN KEY(PKFK_CODDEPARTAMENTO) 
	REFERENCES DEPARTAMENTO (PK_CODDEPARTAMENTO),
	CONSTRAINT PK_COMPOSTA PRIMARY KEY(PKFK_MATRICULA, PKFK_CODDEPARTAMENTO) 


)


INSERT INTO FUNCAO
values(111, 'Professor', 3500.50)

insert into departamento(nome_departamento)
values('Vendas')

insert into funcionario
values(108, 'Pardal', 111)



CREATE TABLE CURSO(
	COD_CURSO INTEGER PRIMARY KEY,
	CAMPUS VARCHAR(50),
	NOME_CURSO VARCHAR(50)
	)

INSERT INTO CURSO
VALUES (1, 'Juazeiro', 'Eng. Computacao')

/*inserindo e deixando o campus como null*/
INSERT INTO CURSO(COD_CURSO, NOME_CURSO)
VALUES (7, 'Enfermagem')

/*mostra todas as colunas da tabela curso*/
select * from curso 


select * from curso
where nome_curso='Eng. Computacao'

select * from funcao
where salario > 5000

/*o like refina a busca, no caso aqui, se tiver iniciando em E, ele mostra no output*/
select * from curso where nome_curso like 'E%'

/*o upper deixa as letras maisculas*/
INSERT INTO FUNCAO
VALUES (333, UPPER('Vendedor'), 1800.66);

/*mostra os que tem o campus como nulo*/
select * from curso where campus is null

/*mostra as seguintes colunas da tabela curso*/
select cod_curso, campus, nome_curso from curso

/*deixa essas colunas em maisculo, mas não salva na tabela principal, somente pra visualizacao*/
select upper(campus), upper(nome_curso)
from curso

/*mesmo caso da anterior, so que minusculo agora*/
select lower(campus), lower(nome_curso)
from curso

/*deixa a primeira letra da palavra em maisculo*/
select initcap(campus), initcap(nome_curso)
from curso

/*seleciona o maior salario da tabela funcao*/
select max (salario) from funcao


/*mostra a soma dos salarios da tabela funcao*/
select sum (salario) from funcao

/*mostra a media dos salarios*/
select avg (salario) from funcao

/*mostra a quantidade de registros na tabela funcao*/
select count (*) from funcao

/*quantidade de cursos cujo cod e >3*/
select count (*) from curso
where cod_curso >3

/*excluindo o registro cujo cod_curso e=8*/
delete from curso
where cod_curso=8

delete from curso
where nome_curso='Eng. Civil'

/*atualiza e adiciona o campo de campus q antes nao tinha*/
update curso
set campus='Petrolina'
where cod_curso=8


/*novo bd, o da matricula*/

create table disciplina(
	codDisciplina serial primary key,
	qtCred numeric(3),
	nomeDisciplina varchar(50) not null
	);
create table aluno(
	cpf numeric(11) primary key,
	nomeAluno varchar(50) not null,
	telefone numeric(13) null
	);

create table turma(
	codTurma serial primary key,
	curso varchar(50) not null,
	sala numeric(3) null,
	codDisciplina serial not null,
	constraint fkDisciplina foreign key(codDisciplina) references Disciplina (codDisciplina)
)

create table matricula(
	cpf numeric(11),
	codTurma serial,
	periodo numeric(5) not null,
	constraint pkMatricula primary key (cpf, codTurma),
	constraint fkAluno foreign key(cpf) references Aluno(cpf),
	constraint fkTurma foreign key(codTurma) references Turma(codTurma)
)

/*insercoes em aluno*/
insert into aluno values(11121314156, 'Huguinho', 879999999999);

insert into aluno values(22222222222, 'Zezinho');

insert into aluno values(44552563478, 'Irmão Metralha', 8798888256414);

select * from aluno

/*insercoes em disciplina*/
insert into disciplina(qtcred, nomeDisciplina) values (3, 'ANALISE E PROJETO DE SOFTWARE');

insert into disciplina(qtCred, nomeDisciplina) values(2, 'METODOLOGIA DA PESQUISA');

insert into disciplina(qtCred, nomedisciplina) values(3, 'P.O.O');

select * from disciplina

insert into turma(curso, sala, coddisciplina) values ('ENGENHARIA DE SOFTWARE',	 111, 3)

insert into matricula(cpf, codturma, periodo) values(22222222222, 1, 2021);

/*mostra os alunos matriculados na turma, lembrar do insert da linha 165, 180 e 182*/
select aluno.nomealuno, turma.curso, turma.codturma 
from matricula, aluno, turma
where matricula.cpf=aluno.cpf and
matricula.codturma=turma.codturma

/*faz uma consulta e mostra nomes cuja tem essa string ai */
select * from aluno where nomealuno like '%Irm%'


/*INSERINDO algumas turmas  de acordo com o curso e disciplina*/
insert into turma(curso, sala, coddisciplina)
values ('ENGENHARIA MECÂNICA', 113, 8);

insert into turma(curso, sala, coddisciplina)
values ('ENGENHARIA MECÂNICA', 126, 9);

insert into turma(curso, sala, coddisciplina)
values ('ENGENHARIA CIVIL', 145,4);

insert into turma(curso, sala, coddisciplina)
values ('ENGENHARIA MECÂNICA', 136, 5);

insert into turma(curso, sala, coddisciplina)
values ('ENGENHARIA DA COMPUTAÇÃO', 174, 6);

insert into turma(curso, sala, coddisciplina)
values ('ENGENHARIA DA COMPUTAÇÃO', 116, 7);

/*ajeitando a turma que eu coloquei que pertencia a mecanica, mas na real era de civil*/
update turma
set curso='ENGENHARIA CIVIL'
where codturma=9

/*mais insercoes em aluno para testar uma coisa*/
insert into aluno
values (12345678901, 'Rubens', 74988452545);

insert into aluno
values (00114585961, 'Matheus', 87991145236)

insert into aluno values (33145278963, 'Irmã Metralha');

/*apagando registros em aluno que possuem essa string */
delete from aluno where nomealuno like '%Irm%';

/*mostra os cursos e as respectivas turmas que estao ligadas aqueles cursos*/
select turma.curso, disciplina.nomedisciplina
from turma, disciplina
where turma.coddisciplina = disciplina.coddisciplina

select * from aluno where lower(nomealuno)= lower('Huguinho')

select * from aluno where telefone is not null

select * from turma where sala >100 and sala <=120

/*teste sobre chave estrangeira*/

create table usuario(
	cpf numeric(10) primary key,
	nome varchar(40) not null,
	idade numeric not null

);

insert into usuario values(123, 'Rogerio', 23);
insert into usuario values(365, 'Bento', 22);
insert into usuario values(741, 'Caio', 34);
insert into usuario values(364, 'Dantas', 45);


create table pedidos(
	id serial not null primary key,
	pedidoNum numeric(10) not null,
	cpf numeric(10),
	constraint fk_cpf foreign key (cpf)
	references usuario(cpf)

);


insert into pedidos(pedidoNum, cpf) values
	(5826, 123);
insert into pedidos(pedidoNum, cpf) values
	(621, 123);
insert into pedidos(pedidoNum, cpf) values
	(3611, 365);
insert into pedidos(pedidoNum, cpf) values
	(4712, 741);
insert into pedidos(pedidoNum, cpf) values
	(874, 741);


select pedidos.pedidoNum, usuario.nome 
from pedidos, usuario
where pedidos.cpf = usuario.cpf