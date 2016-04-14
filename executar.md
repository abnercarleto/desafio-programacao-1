#Instalar e executar

Descrições de instalação e execução do sistema.

A aplicação usa:

- ruby na versão 2.2
- docker para executar o banco de dados no ambiente de desenvoldimento
- PostgreSQL 9.4
- rails 4.2

##Instalar

* Ruby 2.2 - https://www.ruby-lang.org/pt/documentation/installation/
* docker - https://docs.docker.com/engine/installation/

##Subir banco de dados

```bash
$ docker-compose -f nexaas_vendas/docker/dev.yml up -d
```

##Iniciar aplicação
```bash
$ cd nexaas_vendas
$ bundle install
$ rake db:create
$ rake db:migrate
$ rails server
```

Acessar o endereço [localhost:3000](http://localhost:3000)

##Parar banco de dados
```bash
$ docker-compose -f nexaas_vendas/docker/dev.yml stop
```
