# Imagem base
FROM ruby:3.2

# Atualiza os pacotes e instala as dependências necessárias
RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips42 \
    nodejs \
    yarn \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Atualiza o RubyGems e instala o Bundler
RUN gem install rubygems-update -v 3.3.26 && update_rubygems && gem install bundler

# Configura as variáveis de ambiente para o Rails
ENV RAILS_ENV=production
ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

# Define o diretório de trabalho
WORKDIR /usr/src/app

# Copia o arquivo entrypoint.sh e ajusta suas permissões
COPY entrypoint.sh C:\Users\Dev\Downloads\DevOps\DevOps\devopscaseback\entrypoint.sh
RUN chmod +x C:\Users\Dev\Downloads\DevOps\DevOps\devopscaseback\entrypoint.sh

# Copia o restante do código
COPY . .

# Instala as dependências do projeto sem os grupos de desenvolvimento e teste
RUN bundle config set without 'development test' && bundle install

# Define o ENTRYPOINT para o script de entrada
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

# Expõe a porta 3000
EXPOSE 3000

# Comando padrão para iniciar o servidor Rails
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
