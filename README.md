# GOOD LOOKING

Aplicativo desenvolvido para facilitar a o gerenciamento de serviços prestados por profissionais da área da estética. Disponibilizando uma forma simples de registrar todos os serviços prestados e ter um controle consistente sobre os dados de clientes e serviços prestados.

## Novas funcionalidades

0. Banco de dados
   1. Criação do banco de dados utilizando SQLite
      ```SQL
      CREATE TABLE `customer` (
         `id`	INTEGER PRIMARY KEY AUTOINCREMENT,
         `name`	TEXT NOT NULL,
         `phone`	TEXT,
         `email`	TEXT,
         `home_address`	TEXT,
         `observations`	TEXT
      );

      CREATE TABLE `service` (
         `id`	INTEGER PRIMARY KEY AUTOINCREMENT,
         `name`	TEXT NOT NULL,
         `description`	TEXT,
         `cost`	REAL NOT NULL
      );

      CREATE TABLE `record` (
         `id`	INTEGER PRIMARY KEY AUTOINCREMENT,
         `create_at`	TEXT NOT NULL,
         `service_date`	TEXT NOT NULL,
         `service_hour`	TEXT NOT NULL,
         `description`	TEXT,
         `done`	INTEGER NOT NULL DEFAULT 0,
         `customer`	INTEGER NOT NULL,
      FOREIGN KEY(`customer`) REFERENCES `Customer`(`id`)
      );

      CREATE TABLE `service_offered` (
         `id`	INTEGER PRIMARY KEY AUTOINCREMENT,
         `amount_paid`	REAL NOT NULL,
         `record`	INTEGER NOT NULL,
         `service`	INTEGER NOT NULL,
         FOREIGN KEY(`record`) REFERENCES `record`(`id`),
         FOREIGN KEY(`service`) REFERENCES `service`(`id`)
      );
      ```

1. Cliente
   1. Registrar cliente (Fidelização)
      ```sql
      insert into Customer (name, phone, email, home_address, observations)
      values ('Cliente 01', '86912345678', '', '', '');
      ```
   2. Atualizar dados do cliente
      ```sql
      update Customer 
      set name = 'Cliente 01',
            phone = '',
            email = '',
            home_address = '',
            observations = ''
      where id = 2;
      ```
   3. Deletar cliente
      ```sql
      delete from Customer where id = 3;
      ```
   4. Selecionar todos os clientes por ordem de nome
      ```sql
      select * from Customer order by name;
      ```
   5. Seelcionar o cliente que possui a maior número de registros
      ```sql
      select *, count(customer) as record_count from customer c inner  join record r
      on c.id = r.customer group by customer order by record_count desc;
      ```
   6. Selecionar o cliente que mais gasta
   7. Selecionar cliente por busca
      ```sql
      select * from customer where name like 'c%';
      ```
2. Serviço
   1. Registrar Serviço
      ```sql
      insert into service (name, description, cost)
      values ('Barba', 'Descrição qualquer', 5.00);
      ```
   2. Atualizar serviço
      ```sql
      update service 
      set name = 'Fazer barba',
            description = 'Barba masculina',
            cost = 6.0
      where id = 1;
      ```
   3. Deletar serviço
      ```sql
      delete from service where id = 2;
      ```
   4. Selecionar todo os serviços por nome
      ```sql
      select * from service order by name;
      ```
   5. Selecionar serviço com base na busca
   6. Selecionar o serviço mais caro e o mais barato
   7. Selecionar o serviço mais vendido
   8. Selecionar o cliente mais fiel de um serviço
3. Registro
   1. Iniciar registro (Agendamento ou criação de um serviço para um cliente)
      ```sql
      insert into record (create_at, service_date, service_hour, description, done, customer)
      values ('now', 'today', 'now', 'Nothing', 0, 1);
      ```
   2. atualizar registro
      ```sql
      update record 
      set create_at = 'now',
            service_date = 'tomorow', 
            service_hour = '', 
            description = ''
      where id = 1;
      ```
   3. Deletar registro
      ```sql
      delete from record where id = 2;
      ```
   4. Concluir serviço
      ```sql
      update record 
      set done = 1
      where id = 1;
      ```
   5. Selecionar todos os registros
      ```sql
      select * from record order by service_date desc;
      ```
   6. Selecionar todos os registros de acordo com a data
      ```sql
      abc
      ```
   7. adicionar serviço ao registro
      ```sql
      insert into service_offered(amount_paid, record, service)
      values (10.0,  1, 1);
      ```
   8. Calcular o total do registro baseado nos serviços registrados
      ```sql
      select r.*, sum(so.amount_paid) as total from record as r inner join service_offered as so
      on r.id = so.record inner join service as s
      on so.service = s.id;
      ```
   9. Selecionar todos os registros com os serviços
      ```sql
      select so.id, so.amount_paid, r.*, s.* from record as r inner join service_offered as so
      on r.id = so.record inner join service as s
      on so.service = s.id;
      ```
   10. remover serviço do registro
      ```sql
      delete from service_offered where id = 2;
      ```
   11. Atualizar o valor recebido no serviço
      ```sql
      update service_offered
      set amount_paid = 6.0
      where id = 1;
      ```
   12. Selecionar o registro mais caro ou mais barato
   13. Selecionar o registro com o maior número de serviços

## DESENVOLVIMENTO

Aplicativo android desenvolvido utilizando visual studio code como editor de códigos, junto ao framework Flutter, que foi desenvolvido na linguagem de programação Dart.

### Tecnologias utilizadas

1. **Flutter** - Framework desenvolvido em dart para facilitar o desenvolvimento de aplicativos multiplataforma (Android e IOS).

<img src="https://github.com/PedroHenriqueDevBR/Good-Look-App/blob/master/planning/docs/flutter.png" alt="Modelagem da aplicação" width="50%" />

2. **Visual Studio Code** - Por ser leve, simples de utilizar e já possuir extensões para o desenvolvimento com Flutter, o visual studio code foi o editor de códigos escolhido para o desenvolvimento do projeto.

<img src="https://github.com/PedroHenriqueDevBR/Good-Look-App/blob/master/planning/docs/vscode.png" alt="Android studio logo" width="40%" />

3. **SQLite** - Banco de dados utilizado para armazenar as informações do usuários e de todas os registros da aplicação.

<img src="https://github.com/PedroHenriqueDevBR/Good-Look-App/blob/master/planning/docs/sqlite.png" alt="Modelagem da aplicação" width="40%" />

## Modelagem do projeto

<img src="https://github.com/PedroHenriqueDevBR/Good-Look-App/blob/master/planning/files/goodlook-models.png" alt="Modelagem da aplicação" width="100%" />

As entidades que compõem as funcionalidades que serão disponibilizadas no aplicativo, são:

- **User** - Define informações sobre os usuários que utilizam a aplicação
- **Client** - Gerencia os dados dos clientes cadastrados.
- **Service** - Gerencia os serviços oferecidos pelo profissional da estética.
- **Register** - Armazena informações sobre os serviços prestados para clientes.

## Mapa da aplicação

Abaixo será apresentado o mapa da aplicação.

<img src="https://github.com/PedroHenriqueDevBR/Good-Look-App/blob/master/planning/files/goodlook-models-screens.png" alt="Modelagem da aplicação" width="100%" />
