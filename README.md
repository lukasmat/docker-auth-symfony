# Symfony5 Docker Development Stack
This is a lightweight stack based on Alpine Linux for running Symfony5 into Docker containers using docker-compose. 

[![Build Status](https://travis-ci.org/coloso/symfony-docker.svg?branch=master)](https://travis-ci.org/coloso/symfony-docker)
### Prerequisites
* [Docker](https://www.docker.com/)

### Container
 - [nginx](https://pkgs.alpinelinux.org/packages?name=nginx&branch=v3.10) 1.18.+
 - [php-fpm](https://pkgs.alpinelinux.org/packages?name=php7&branch=v3.10) 7.4.+
    - [composer](https://getcomposer.org/) 
    - [yarn](https://yarnpkg.com/lang/en/) and [node.js](https://nodejs.org/en/) (if you will use [Encore](https://symfony.com/doc/current/frontend/encore/installation.html) for managing JS and CSS)
- [mysql](https://hub.docker.com/_/mysql/) 5.7.+

### Installing

run docker and connect to container:
```
 docker-compose up --build
```
```
 docker-compose exec php sh
```

install latest version of [Symfony](http://symfony.com/doc/current/setup.html) via composer:
```
# traditional web application: 
$ composer create-project symfony/website-skeleton .
```
or
```
# microservice, console application or API:
$ composer create-project symfony/skeleton .
```

modify your DATABASE_URL config in .env 
```
DATABASE_URL=mysql://root:root@mysql:3306/symfony?serverVersion=5.7
```

call [localhost](http://localhost/) in your browser
 
 # Symfony4 jwt auth
 
 1. Get gode from git: git@github.com:lukasmat/symfony4_auth.git
 2. composer install
 3. Confige .env file DB, JWT_PASSPHRASE, etc...
 
 ## Database config:
 1. Create new database: php bin/console doctrine:database:create
 2.  Ceate a migration: php bin/console make:migration
 3. Create database tables form migrations files: php bin/console doctrine:migrations:migrate
 
 ## Api headers:
 
 
 ###Postman
 - Authorization. Type: Bearer Token
 
 ### Create user
 - Url: http://127.0.0.1:8000/api/users
 - POST
 
 ```json
 {
   "username": "newusername",
   "password": "Labas147",
   "retypedPassword": "Labas147",
   "name": "New Username",
   "email": "newusername@newusername.lt"
 }
 ```
  ### User login
 - Url: http://127.0.0.1:8000/api/login_check
 - POST
 
 ```json
 {
   "username": "newusername",
   "password": "Labas147"
 }
 ```
 
 ### Get user info
 - Url: http://127.0.0.1:8000/api/users/{id}
 - POST
 
 ### Update user info
 - Url: http://127.0.0.1:8000/api/users/{id}
 - PUT
 
 ```json
 {
   "name": "New Username",
   "email": "newusername@newusername.lt"
 }
 ```
 
 ### Reset user password
 - Url: http://127.0.0.1:8000/api/users/{id}/reset-password
 - PUT
 
 ```json
 {
   "newPassword": "newPasword4758",
   "newRetypedPassword": "newPasword4758",
   "oldPassword": "string1111111"
 }
 ```
 ### User confirmation
 - Url: http://127.0.0.1:8000/api/users/confirm
 - POST
 
 ```json
 {
   "confirmationToken": "d272neDdcLdg32MqyFbG8rFNtz60Mr"
 }
 ```

