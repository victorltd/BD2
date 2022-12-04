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

/*teste, n sei se funciona*/
create table bancoSangue(
	id serial primary key,
	nome varchar(50) not null,
	tipoSangDisp varchar(3) not null,
	rua varchar(50) not null,
	numero numeric(10) not null,
	cidade varchar(50) not null,
	estado varchar(20)
);

insert into bancoSangue(nome, tipoSangDisp, rua, numero, cidade, estado)
values(Hemoba, 