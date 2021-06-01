/*
 * Criação da tabela usuário
*/
CREATE TABLE user (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	login TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);

/*
 * Criação da tabela cliente
*/
CREATE TABLE client (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	phone TEXT,
	email TEXT,
	address TEXT,
	observations TEXT,
	user int,
	FOREIGN KEY(user) REFERENCES user(id)
);

/*
 * Criação da tabela serviço
*/
CREATE TABLE service (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	description TEXT,
	total_cost REAL,
	price REAL,
	user int,
	FOREIGN KEY(user) REFERENCES user(id)
);

/*
 * Criação da tabela movimentação
*/
CREATE TABLE register (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	created_at TEXT NOT NULL,
	service_date TEXT,
	hour_service TEXT,
	description TEXT,
	done BLOB,
	amount_paid REAL,
	client int,
	user int,
	FOREIGN KEY(client) REFERENCES client(id),
	FOREIGN KEY(user) REFERENCES user(id)
);

CREATE TABLE register_services (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	register int,
	service int,
	FOREIGN KEY(register) REFERENCES register(id),
	FOREIGN KEY(service) REFERENCES service(id)
);

-- Cadastrar novo usuário - OK
insert into user (name, login, password)
values ('admin', 'admin', 'admin');

-- Cadastrar novo cliente
insert into client 
(name, phone, email, address, observations, user)
values 
('Maria da Luz', '12345678', 'maria@gmail.com', 'Rua das flores', 'Não cadastrado', 1),
('Carla Sammya', '12345678', 'sammya@gmail.com', 'Rua das flores', 'Não cadastrado', 1),
('July', '12345678', 'julianday@gmail.com', 'Rua das flores', 'Não cadastrado', 1),
('Keily', '12345678', 'keily@gmail.com', 'Rua das flores', 'Não cadastrado', 1);

-- Cadastrar novo servico
insert into service (name, description, total_cost, price, user) 
values 
('Escova', 'Faz escova nos cabelos', 5, 10, 1),
('Progressiva', 'Faz progressiva nos cabelos', 16, 50, 1),
('Corte normal', 'Corte de cabelo masculino', 3, 15, 1);

-- Cadastrar novo registro
insert into register 
(created_at, service_date, hour_service, description, done, amount_paid, client, user)
values
('2020-03-07', '2020-03-07', '18:00', 'Fist register', 1, 1, 1, 1);

-- Cadastrar um servico em um determinado registro
insert into register_services (register, service)
values (1, 1);


/*
 * Querys para gerenciamento de usuários
*/

-- Cadastrar novo usuário - OK
insert into user (name, login, password)
values ('', '', '');

-- Seleciona usuário pelo id - OK
select * from user where id = 1;

-- Seleciona usuário por username - OK
select * from user where login like "";

-- Verifica se um usuário está cadastrado, com base no username e password - OK
select * from user where login like "" and password like "";

-- altera os dados de um usuário pelo id - OK
update user 
set name = '',
login = ''
where id = 1;

-- update password - OK
update user 
set password = ''
where id = 1;

-- deletar usuário - OK
delete from user where id = 3;


/*
 * Querys para gerenciamento de clientes
*/

-- Cadastrar novo cliente
insert into client 
(name, phone, email, address, observations, user)
values 
('', '', '', '', '', 1);

-- Selecionar todos os clientes vinculados a um usuário
select c.* from client c inner join user u
on c.user = u.id;

-- Selecionar todos os usuários vinculados ao usuário logado
select * from client c inner join user u
on c.user = u.id 
where u.id = 1;

-- altera os dados de um cliente pelo id
update client set 
name = '',
email = '',
address = '',
observations = ''
where id = 1;

-- deletar cliente
delete from client where id = 2;


/*
 * Querys para gerenciamento de servicos
*/

-- Cadastrar novo servico
insert into service (name, description, total_cost, price)
values ('', '', 0, 0);

-- Alterar os dados de um servico pelo id
update service set 
name = '',
description = '',
total_cost = 0,
price = 0
where id = 1;

-- selecionar todos os serviços
select s.* from service s inner join user u 
on s.user = u.id where u.id = 2;

-- Selecionar um serviço específico pelo id
select s.* from service s inner join user u 
on s.user = u.id where s.id = 2;

-- Atualizar dados de um Serviço
update service set 
name = 'Corte de cabelo',
description = 'Descrição qualquer',
total_cost = 0,
price = 0
where id = 3;

-- Deletar servico pelo id
delete from service where id = 3;

/*
 * Querys para gerenciamento de registros
*/

-- Cadastrar novo registro
insert into register 
(created_at, service_date, hour_service, description, done, amount_paid, client, user)
values
('2020-03-07', '2020-03-07', '18:00', 'Fist register', 1, 1, 1, 1);

-- Cadastrar um servico em um determinado registro
insert into register_services (register, service)
values (1, 1);

-- Selecionar todos os servicos vinculados a um determinado registro.
select r.*, s.* from register r inner join register_services rs 
on r.id = rs.register inner join service s 
on rs.service = s.id
where r.id = 1;
