## 1. Configurações da Imagem
FROM ruby:2.7.3-alpine

## 2. Instalação de pacotes
RUN apk add --update --no-cache shared-mime-info tzdata yarn nodejs build-base postgresql-dev

RUN gem install bundler -v 2.2.14

## 3. Preparando o Rails
RUN mkdir /app

WORKDIR /app

COPY Gemfile Gemfile.lock vendor ./

RUN bundle install

COPY . .

## 4. Iniciando
ENTRYPOINT ["./entrypoints/docker_entrypoint.sh"]