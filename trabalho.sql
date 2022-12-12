create table doador(
	cpf numeric(11) not null primary key,
	nome varchar(50) not null,
	tipoSangui varchar(2) not null,
    rh varchar(2) not null,
	dataDoacao date not null,
	genero varchar(2) not null,
	idade numeric(2) not null,
	rua varchar(20) not null,
	numero numeric(10) not null,
	cidade varchar(20) not null,
	estado varchar(20) not null,
	doenca varchar(30)
	)


    create table doador(
	cpf numeric(11) not null primary key,
	nome varchar(50) not null,
	tipoSangui varchar(2) not null,
        rh varchar(2) not null,
	dataDoacao date not null,
	sexo varchar(2) not null,
	idade numeric(2) not null,
	rua varchar(20) not null,
	numero numeric(10) not null,
	cidade varchar(20) not null,
	estado varchar(20) not null,
	doenca varchar(30),
	constraint check_sexo check  (sexo='M' or sexo='F'),
	constraint checkRH check  (rh='+' or rh='-'),
	constraint check_tipoS check  (tipoSangui='A' or tipoSangui='B'
	or tipoSangui='O' or tipoSangui='AB')

	)
    

    
insert into doador values(
	90915025256, 'Betina Lúcia Sônia', 'A', '-', '2022-05-08','F', 36,
	'Avenida Bartolomeu' , 280, 'Rio de Janeiro', 'RJ')


create table sangue(
	id serial  primary key,
	tipoSangui varchar(2) not null,
	rh varchar(2) not null,
	constraint checkRH check  (rh='+' or rh='-'),
	constraint check_tipoS check  (tipoSangui='A' or tipoSangui='B'
	or tipoSangui='O' or tipoSangui='AB')
	);

insert into sangue (tipoSangui, rh) values(
	'A','-');
	
insert into sangue (tipoSangui, rh) values(
	'B','-');	


/*AS COISAS SO COMECAM A DAR CERTO A PARTIR DAQUI
/*referente ao banco de sangue*/
create table bancoSangue(
	idBanco serial primary key,
	nomeBanco varchar(30) not null,
	rua varchar(40) not null,
	cidade varchar(20) not null,
	estado varchar(20) not null,
	telefone numeric(12) not null,
	nomeGerente varchar(20) not null,
	telefoneGerente numeric(12)
	);

insert into bancoSangue(nomeBanco, rua, cidade, estado, telefone, nomeGerente, telefoneGerente)
values ('Hemoba', 'Rua  R. Alto Cheiroso, 236', 'Juazeiro', 'BA', 7436117532, 'Ricardo Braga', 74988154836);

insert into bancoSangue(nomeBanco, rua, cidade, estado, telefone, nomeGerente)
values ('Hemope', 'R. Pacífico da Luz, s/n', 'Petrolina', 'PE', 8738666601, 'Amanda Menezes');


insert into bancoSangue(nomeBanco, rua, cidade, estado, telefone, nomeGerente, telefoneGerente)
values ('Hemope', 'Av. Oswaldo Cruz, S/N', 'Caruaru', 'PE', 8137199565, 'Daiane Soares', 81999854715);

insert into bancoSangue(nomeBanco, rua, cidade, estado, telefone, nomeGerente, telefoneGerente)
values ('Hemope', 'Rua Joaquim Nabuco, 171', 'Recife', 'PE', 8131824600, 'Flavio Figueiredo', 81991257436);
*/

insert into bancoSangue(nomeBanco, rua, cidade, estado, telefone, nomeGerente, telefoneGerente)
values ('Hemocentro Coordenador - Salvador', ' Ladeira do Hospital Geral, s/n', 'Salvador', 'BA',  7131165664, 'Ismael Novaes', 71981458574);

insert into bancoSangue(nomeBanco, rua, cidade, estado, telefone, nomeGerente, telefoneGerente)
values ('UC Hemoba - Hospital Ana Nery - Salvador', ' Rua Saldanha Marinho s/n', 'Salvador', 'BA',  7131172059, 'Alexandre Lima', 74988541475);

/*
alter table bancoSangue
alter column rua type varchar(50);
*/


/*doador, acho que certo agr*/


 create table doador(
	cpfDoador numeric(11) not null primary key,
	nomeDoador varchar(50) not null,
	tipoSanguiDoador varchar(2) not null,
    rhDoador varchar(2) not null,
	dataDoacao date not null,
	sexo varchar(2) not null,
	idade numeric(2) not null,
	rua varchar(20) not null,
	numero numeric(10) not null,
	cidade varchar(20) not null,
	estado varchar(20) not null,
	doenca varchar(30),
	idBanco serial, 
	constraint check_sexo check  (sexo='M' or sexo='F'),
	constraint checkRH check  (rh='+' or rh='-'),
	constraint check_tipoS check  (tipoSanguiDoador='A' or tipoSanguiDoador='B'
	or tipoSanguiDoador='O' or tipoSanguiDoador='AB'),
	constraint fk_idBanco foreign key (idBanco)
	references bancoSangue(idBanco)
	)

insert into doador(cpfDoardor, nomeDoador, tipoSanguiDoador,rh,dataDoacao,sexo,idade,rua,
	numero,cidade,estado,idBanco) 
	values(	90915025256, 'Betina Lúcia Sônia', 'A', '-', '2022-05-08','F', 36,
		'Rua Américo Dourado' , 983, 'Juazeiro', 'BA', 1);

insert into doador(cpfDoardor, nomeDoador, tipoSanguiDoador,rh,dataDoacao,sexo,idade,rua,
	numero,cidade,estado,idBanco) 
	values(	46767097578, 'Nina Lúcia Mariah Assis', 'A', '-', '2022-05-15','F', 19,
		'Rua Tiradentes' , 713, 'Juazeiro', 'BA', 1);

insert into doador(cpfDoardor, nomeDoador, tipoSanguiDoador,rh,dataDoacao,sexo,idade,rua,
	numero,cidade,estado,idBanco) 
	values(	48398036508, 'Luiza Beatriz Stefany Moura', 'B', '+', '2022-04-15','F', 25,
		'Quadra Oito' , 825, 'Juazeiro', 'BA', 1);

insert into doador(cpfDoardor, nomeDoador, tipoSanguiDoador,rh,dataDoacao,sexo,idade,rua,
	numero,cidade,estado,idBanco) 
	values(	84459192454, 'Tânia Bianca Campos', 'AB', '+', '2022-04-30','F', 45,
		'Rua Abacaxi' ,226, 'Petrolina', 'PE', 2);

insert into doador(cpfDoardor, nomeDoador, tipoSanguiDoador,rh,dataDoacao,sexo,idade,rua,
	numero,cidade,estado,idBanco) 
	values(	44982019495, 'Ayla Gabriela da Luz', 'O', '+', '2022-04-30','F', 18,
		'Rua dos Migrantes' ,352, 'Petrolina', 'PE', 2)

select bancosangue.nome, doador.nomeDoador 
from bancosangue, doador
where bancosangue.idbanco = doador.idbanco


/*sangue, parece q certo tb*/


create table sangue(
	idSangue serial  primary key,
	tipoSangui varchar(2) not null,
	rh varchar(2) not null,
	idBanco serial not null,
	cpfDoador numeric(11) not null,
	dataDoacao date not null,

	constraint checkRH check  (rh='+' or rh='-'),
	constraint check_tipoS check  (tipoSangui='A' or tipoSangui='B'
	or tipoSangui='O' or tipoSangui='AB'),

	
	constraint fk_idBanco foreign key (idBanco)
	references bancoSangue(idBanco),
	constraint fk_cpfDoador foreign key (cpfDoador)
	references doador(cpfDoador)
	);


insert into sangue(tipoSangui, rh, idBanco, cpfDoador, dataDoacao) 
values('A', '-', 1, 44982019495, '2022-05-25');
insert into sangue(tipoSangui, rh, idBanco, cpfDoador, dataDoacao) 
values('A', '-', 1, 44982019495, '2022-10-25');
insert into sangue(tipoSangui, rh, idBanco, cpfDoador, dataDoacao) 
values('A', '-', 1, 44982019495, '2022-02-25');
insert into sangue(tipoSangui, rh, idBanco, cpfDoador, dataDoacao) 
values('O', '+', 1, 48398036508, '2022-03-16');
insert into sangue(tipoSangui, rh, idBanco, cpfDoador, dataDoacao) 
values('A', '+', 2, 90915025256, '2022-05-18');



select sangue.idSangue, doador.nomeDoador, sangue.dataDoacao, sangue.idBanco, bancoSangue.nomeBanco
from sangue, doador, bancoSangue
where sangue.cpfDoador = doador.cpfDoador and
	sangue.idBanco = bancoSangue.idbanco

/*paciente*/

create table paciente(
	cpfPaciente numeric(11) primary key,
	nomePaciente varchar(100) not null,
	idade numeric(3) not null,
	telefone numeric(11) not null,
	tipoSanguiP varchar(3) not null,
	rhPac varchar(2) not null,
	dataRegistro date not null,
	idSangue serial not null,

	constraint fk_idSangue foreign key (idSangue)
	references sangue(idSangue),

	constraint checkRH check  (rhPac='+' or rhPac='-'),
	constraint check_tipoS check  (tipoSanguiP='A' or tipoSanguiP='B'
	or tipoSanguiP='O' or tipoSanguiP='AB')
)



insert into paciente(cpfPaciente, nomePaciente, idade,telefone, tipoSanguiP,rhPac, dataRegistro,idSangue)
values (72618676599,'Luna Vanessa Vera Castro',45,7435334452, 'A','-', '2022-10-15', 1);

insert into paciente(cpfPaciente, nomePaciente, idade,telefone, tipoSanguiP,rhPac, dataRegistro,idSangue)
values (35494571548,'Eloá Mariana Isabel da Cruz',36,74981037473, 'A','+', '2022-9-15', 5)

insert into paciente(cpfPaciente, nomePaciente, idade,telefone, tipoSanguiP,rhPac, dataRegistro,idSangue)
values (73600897519,'Yago Igor Mendes',24,74983337508, 'B','-', '2022-10-10', 1);

insert into paciente(cpfPaciente, nomePaciente, idade,telefone, tipoSanguiP,rhPac, dataRegistro,idSangue)
values (12557749591,'Henry Hugo Diogo Santos',29,74997973924, 'A','+', '2022-9-15', 5)

/*essa query mostra os pacientes e as respectivas pessoas que doaram, assim como o hemocentro que foi a doacao*/
select paciente.nomePaciente, doador.nomeDoador, sangue.idBanco, bancoSangue.nomeBanco
from paciente, doador, sangue, bancoSangue
where sangue.cpfDoador = doador.cpfDoador and
	sangue.idBanco = bancoSangue.idbanco and 
	paciente.idSangue = sangue.idSangue

	
/*hospital e intermediariaHospital e banco*/	
create table hospital(
	idHospital serial primary key,
	nomeHospital varchar(50) not null,
	ruaH varchar(50) not null,
	cidade varchar(50) not null,
	estado varchar(10) not null
	);
	

create table contactaHospBanco(
	idHospital serial not null,
	idBanco serial not null,
	constraint fk_idHospital foreign key (idHospital)
	references hospital(idHospital),
	constraint fk_idBanco foreign key (idBanco)
	references bancoSangue(idBanco),

	constraint pk_HospBanco primary key(idHospital, idBanco)
)


insert into hospital(nomeHospital, ruaH, cidade, estado) values(
	'Hospital Dia São Lucas', 'Av. São João, 365','Juazeiro', 'BA');

insert into hospital(nomeHospital, ruaH, cidade, estado) values(
	'Hospital Regional de Juazeiro', 'Tv. do Hospital, s/n ','Juazeiro', 'BA');

insert into hospital(nomeHospital, ruaH, cidade, estado) values(
	'Clise Hospital da Criança - Maternidade', 'Av. Raul Alves, 1098','Juazeiro', 'BA');

insert into hospital(nomeHospital, ruaH, cidade, estado) values(
	'Hospital SOTE - Juazeiro', 'Tv. Paulo Afonso, 1','Juazeiro', 'BA');

insert into hospital(nomeHospital, ruaH, cidade, estado) values(
	'Hospital Unimed', 'R. do Paraiso, 409','Juazeiro', 'BA');
insert into hospital(nomeHospital, ruaH, cidade, estado) values(
	'Hospital Memorial Petrolina', 'T R. Tobias Barreto, 2','Petrolina', 'PE')

 
insert into contactaHospBanco values(3,1);
insert into contactaHospBanco values(3,2);
insert into contactaHospBanco values(2,1);
insert into contactaHospBanco values(6,2);
insert into contactaHospBanco values(7,2);

/*mostra os hospitais que solicitaram sangue e o respectivo banco de sangue que foi solicitado*/
select bancoSangue.nomeBanco, hospital.nomeHospital
from contactaHospBanco, bancoSangue, hospital 
where bancoSangue.idBanco = contactaHospBanco.idBanco and
	hospital.idHospital = contactaHospBanco.idHospital



/*comandos*/
Alter Table:
	Adicionar Coluna (ADD)
	Alterar Tipo de Dados (MODIFY)
	Renomear uma Tabela (RENAME)
	Renomear uma Coluna (RENAME COLLUMN)
	Inserir Valores em uma Tabela (INSERT)
Valor Máximo ou Mínimo de uma Coluna (MAX/MIN)
Valor médio de uma Coluna (AVG)
Contagem de Elementos (COUNT)
SELECT
SELECT - Expressões Aritméticas
SELECT ALIASES
SELECT – Concatenação de Colunas/Literais
SELECT – Valores Nulos (NULL / NVL)
SELECT DISTINCT
SELECT ORDER BY (ASC E DESC)
SELECT – WHERE
	Operador IN
	Operador BETWEEN
	Operador LIKE
	Operador IS NULL
SELECT – Expressões Negativas
	Operador IN
	Operador BETWEEN
	Operador LIKE
	Operador IS NULL
	JOIN
CLÁUSULAS E OPERADORES
Consultas Encadeadas
Operador de Conjunto
	UNION/UNION ALL
	INTERSECT
	MINUS
Operador de Conjuntos Juntos
Funções de Conversão
	Letras Maiúsculas ou Minúsculas (UPPER/INITCAP/LOWER)
FUNÇÕES DE MANIPULAÇÃO
	CONCAT
	SUBSTR
	LENGTH
	INSTR
	LPAD
Funções Numéricas
	ROUND/TRUNC
	VIEW
	UPDATE
	DELETE
	GROUP BY
	HAVING
Subconsulta

/*insercao no banco de sangue*/

insert into bancoSangue(nomeBanco, rua, cidade, estado, telefone, nomeGerente, telefoneGerente) values ('Hemocentro Regional Garanhuns','Rua Gonçalves Maia, s/n','Garanhuns','Pernambuco',8737618520,'Gabrielly Allana Nascimento',4229807194);
insert into bancoSangue(nomeBanco, rua, cidade, estado, telefone, nomeGerente, telefoneGerente) values ('Hemocentro Regional Palmares','Hospital Regional dos Palmares - Engenho Quilombo dos Palmares BR 101 - Km 185','Palmares','Pernambuco',8194885974,'Sarah Melissa Santos',87992834685);
insert into bancoSangue(nomeBanco, rua, cidade, estado, telefone, nomeGerente, telefoneGerente) values ('Núcleo de Hemoterapia Regional Salgueiro','Rua Joaquim Gondim, 65','Salgueiro','Pernambuco',8738716569,'Sarah Mirella Elaine Vieira',87985542009);
insert into bancoSangue(nomeBanco, rua, cidade, estado, telefone, nomeGerente, telefoneGerente) values ('Hemocentro Regional Barreiras ','Rua Paulo Afonso, s/n','Barreiras','Bahia',7736133799,'Kevin Manoel Fernandes',77987487289);
insert into bancoSangue(nomeBanco, rua, cidade, estado, telefone, nomeGerente, telefoneGerente) values ('UCT Hemoba - Camaçari','Avenida Jorge Amado, s/n','Camaçari','Bahia',7136444252,'Sebastião Isaac Noah Silveira',71982596161);
insert into bancoSangue(nomeBanco, rua, cidade, estado, telefone, nomeGerente, telefoneGerente) values ('UCT Hemoba - Feira de Santana',' Avenida Presidente Dutra, s/n','Feira de Santana','Bahia',7536141556,'Gabriel Isaac Martins',71985511572);


"insert into doador(cpfDoardor, nomeDoador, tipoSanguiDoador,rh,dataDoacao,sexo,idade,rua,
 numero,cidade,estado,idBanco) 
 values("

/*ALTER TABLE*/
/*ADD*/
Alter table paciente ADD sexo varchar(2) NULL;
Alter table paciente add doencaPac varchar(20) null;

/*rename*/
ALTER TABLE bancoSangue
  RENAME TO bancodeSangue;

  ALTER TABLE paciente
  RENAME TO pacientes;

/*rename column*/
ALTER TABLE doador 
RENAME COLUMN rh TO rhDoador;

ALTER TABLE sangue 
RENAME COLUMN rh TO rhSangue;

/*max/min*/
select max(datadoacao) from sangue;

select min(idade) from doador;


