#!/bin/bash

# Saída imediata se qualquer comando falhar
set -e

# Função para verificar se o banco de dados está pronto
function check_db {
  until (echo > /dev/tcp/db/5432) >/dev/null 2>&1
  do
    echo "Aguardando o banco de dados ficar disponível..."
    sleep 1
  done
}

# Verifica se o banco de dados está pronto
echo "Verificando conexão com o banco de dados..."
check_db
echo "Banco de dados conectado com sucesso!"

# Executa as migrações pendentes
echo "Executando migrações do banco de dados..."
bundle exec rails db:migrate RAILS_ENV=development

# Inicializa o servidor Rails
echo "Iniciando o servidor Rails..."
exec bundle exec rails server -b 0.0.0.0
