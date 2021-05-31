# GOOD LOOKING

Aplicativo desenvolvido para facilitar a o gerenciamento de serviços prestados por profissionais da área da estética. Disponibilizando uma forma simples de registrar todos os serviços prestados e ter um controle consistente sobre os dados de clientes e serviços prestados.

## Novas funcionalidades

1. Cliente
   1. Registrar cliente (Fidelização)
   2. Atualizar dado do cliente
   3. Deletar cliente
   4. Seelcionar o cliente que possui a maior número de registros
   5. Selecionar o cliente que mais gasta
   6. Selecionar o cliente que gasta mais em um único atendimento
   7. Selecionar cliente por busca
2. Serviço
   1. Registrar Serviço
   2. Atualizar serviço
   3. Deletar serviço
   4. Selecionar todo os serviços
   5. Selecionar serviço com base na busca
   6. Selecionar o serviço mais caro e o mais barato
   7. Selecionar o serviço mais vendido
   8. Selecionar o cliente mais fiel de um serviço
3. Registro
   1. Iniciar registro (Agendamento ou criação de um serviço para um cliente)
   2. atualizar registro
   3. Deletar registro
   4. Concluir serviço
   5. Selecionar todos os registros
   6. Selecionar todos os registros de acordo com a data
   7. adicionar serviço ao registro
   8. Calcular o total do registro baseado nos serviços registrados
   9. Selecionar o registro mais caro ou mais barato
   10. Selecionar o registro com o maior número de serviços

## Funcionalidades

1. Gerenciamento de usuários para acesso ao aplicativo
   1. Cadastro de usuários
   2. Alteração de dados cadastrais
   3. Login na alpicação
   4. Logout da aplicação
   5. Criação de usuário administrador
      1. Edição de dados de usuários não administradores
      2. Exclusão de perfis de usuários não administradores
2. Gerenciamento de serviços prestados pelo perfil logado
   1. Cadastro de serviços
   2. Edição de serviços
   3. Exclusão de registros
3. Gerenciamento de clientes
   1. Cadastro de clientes
   2. Edição de clientes
   3. Exclusão de clientes
4. Registros de serviços prestados para clientes
   1. Criação de ordem de serviço
   2. Vinculo de serviços à ordem selecionada
   3. Edição da ordem de serviço
   4. Exclusão da ordem de serviço
5. Geração de relatórios
   1. Perfil que mais atendeu ordem de serviços
   2. Serviço mais executado do perfil logado
   3. Lista de todos os serviços prestados
   4. Lista dos serviços mais caros
   5. Serviços que mais geraram lucro para o perfil
6. Exportação de relatórios.
   1. Exportar para a memória interna do dispositivo

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
