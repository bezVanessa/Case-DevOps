echo "# Projeto Pokémon API

Este projeto consiste em uma aplicação com um backend em Ruby on Rails, um frontend em Node.js e Nginx, e um banco de dados PostgreSQL. O objetivo é buscar informações de Pokémon usando a PokeAPI e armazená-las localmente em um banco de dados.

## Índice
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Instalação e Execução](#instalação-e-execução)
- [Modificações Recentes](#modificações-recentes)
- [Métodos de Criação do Banco de Dados](#métodos-de-criação-do-banco-de-dados)
- [Explicação dos Arquivos](#explicação-dos-arquivos)
- [Problemas Conhecidos](#problemas-conhecidos)

## Estrutura do Projeto
### Backend (Ruby on Rails)
Responsável por gerenciar as operações de busca de dados de Pokémon via PokeAPI e interagir com o banco de dados PostgreSQL.

### Banco de dados (PostgreSQL)
Armazena as informações de Pokémon, permitindo realizar buscas e outras operações.

### Frontend (Node.js e Nginx)
Apresenta a interface ao usuário, permitindo buscar Pokémon e visualizar as informações retornadas.

## Instalação e Execução

### Pré-requisitos
- Docker e Docker Compose instalados na máquina.
- Acesso à PokeAPI para obter dados dos Pokémon.

### Passo a Passo para Executar
1. Clone o repositório:

\`\`\`bash
git clone <url-do-repositório>
\`\`\`

2. Navegue até o diretório do projeto:

\`\`\`bash
cd nome-do-projeto
\`\`\`

3. Construa e inicie os contêineres com o Docker Compose:

\`\`\`bash
docker-compose up --build
\`\`\`

Após a construção, o frontend estará disponível em \`http://localhost:3000\`.

## Modificações Recentes
- **Correção de conflitos de versão:** Houve um problema ao tentar configurar o banco de dados com maior precisão devido a conflitos de versões em minha máquina, o que impediu a execução bem-sucedida de algumas tarefas de banco de dados.
- **Ajustes no Docker Compose:** Foram feitos ajustes para garantir que os serviços do backend, frontend e banco de dados funcionem corretamente, incluindo a configuração de versões compatíveis e a definição dos parâmetros necessários para cada serviço.

## Métodos de Criação do Banco de Dados
Para a criação e configuração do banco de dados, você tem duas opções:

### Via Ruby
Use o Rake para criar o banco e carregar dados. Isso deve funcionar automaticamente após a execução do Docker Compose.

### Via SQL
Execute diretamente o script \`init.sql\` localizado em \`D:\\devops\\devopscaseback\\init.sql\`, que contém as instruções SQL necessárias para criar o banco e popular as tabelas.

#### Carregar init.sql Manualmente
Caso precise carregar o banco manualmente, navegue até o diretório do projeto e execute:

\`\`\`bash
psql -U [seu-usuário] -d pokeapi_development -f caminho/do/arquivo/init.sql
\`\`\`

## Explicação dos Arquivos

### Docker Compose
O arquivo \`docker-compose.yml\` orquestra os serviços necessários para o funcionamento da aplicação. Ele define três serviços principais:
- **Backend (Ruby):** Este serviço configura o ambiente Ruby on Rails, que é responsável por lidar com as requisições do frontend, acessar a API externa (PokeAPI) e interagir com o banco de dados.
- **PostgreSQL:** O serviço de banco de dados armazena as informações de Pokémon. A configuração do contêiner do PostgreSQL é especificada no arquivo \`docker-compose.yml\`, incluindo a criação do banco de dados \`pokeapi_development\` e a senha do usuário.
- **Frontend (Node.js e Nginx):** O frontend é responsável pela interface de usuário que interage com o backend. Ele é servido usando o Nginx, configurado para fornecer os arquivos estáticos da aplicação Node.js.

### Arquivo 1: Dockerfile do Backend
Define o ambiente de Ruby, configurando as dependências do backend. Este arquivo configura a execução do servidor e instalação de gems necessárias, como o Rails, que permite a comunicação com o banco de dados PostgreSQL e o consumo da PokeAPI.

### Arquivo 2: Docker Compose
Este arquivo especifica os serviços Docker para rodar o sistema como um todo, incluindo o backend, banco de dados e frontend. As versões de imagem foram ajustadas para evitar conflitos de versão entre os serviços.

### Arquivo 3: config/database.yml
Contém as configurações de conexão com o PostgreSQL. Ele está configurado para conectar ao contêiner do banco de dados com usuário, senha e detalhes específicos da aplicação. Aqui é onde a integração entre o backend e o banco de dados é feita, garantindo que o Rails consiga acessar o PostgreSQL.

### Arquivo 4: config/application.rb
Arquivo principal de configuração do Rails, usado para carregar as tarefas automatizadas de banco de dados, incluindo a inicialização via \`init.sql\`.

### Arquivo 5: db/init.sql
Arquivo SQL responsável por criar e popular as tabelas com informações de Pokémon. Este arquivo pode ser executado manualmente ou automaticamente durante a inicialização do banco de dados, dependendo da escolha do método de configuração.

### Arquivo 6: db/schema.rb
Representa a estrutura atual do banco de dados, incluindo todas as tabelas e colunas geradas. Ele é atualizado automaticamente após a execução das migrações e serve como um "espelho" da estrutura do banco de dados.

### Arquivo 7: Gemfile.lock
Lista as versões exatas das gems e suas dependências. Este arquivo é essencial para garantir que o ambiente de desenvolvimento seja consistente entre as máquinas, evitando problemas de compatibilidade de versões.

### Arquivo 8: Rakefile
Define a tarefa \`db:load_init_sql\` para carregar o arquivo \`init.sql\` automaticamente após a criação do banco. A tarefa executa o script SQL no ambiente de desenvolvimento, populando o banco de dados com as informações de Pokémon.

## Problemas Conhecidos
Infelizmente, devido a conflitos de versões entre as dependências e o ambiente da minha máquina, não foi possível realizar a execução precisa do banco de dados para garantir a integração perfeita entre o PostgreSQL e o backend. Acredito que esse problema de versão pode ser resolvido com a atualização das dependências e ajustes nas versões de imagem dos contêineres, mas não foi possível solucionar completamente até o momento.

A integração entre o backend, frontend e banco de dados é realizada com o Docker Compose, que orquestra os três serviços. O backend interage diretamente com o banco de dados PostgreSQL usando o arquivo \`database.yml\` para configurar a conexão, enquanto o frontend se comunica com o backend via API para buscar as informações dos Pokémon.
" > README.md
