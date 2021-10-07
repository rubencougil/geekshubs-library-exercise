# 📚 GeeksHubs Library Exercise

API REST para gestionar libros.

## Cómo funciona

La API se ha implementado con una pequeña aplicación en Go. 

Si necesitas realizar cambios en la aplicación y quieres lanzarla directamente en tu máquina local necesitas instalar el intérprete de Go y después ejecutar: 

`make run`

y para lanzar los tests

`make test`

## API

* `GET /api/` -> Hello
* `POST /api/books` -> Add Book
* `GET /api/books` -> Get All Books 
* `GET /api/books/:id` -> Get One Book
* `DELETE /api/books/:id` -> Delete Book
* `PUT /api/books/:id` -> Update Book

## ☝️ Tareas

1. Ejecutar la aplicación desde un contenedor de Docker.
   1. Crear Dockerfile
   2. Levantar Aplicación y BD con docker-compose.
2. Crear un pipeline de CI en Github Actions:
   1. Se ejecutará cada vez que se abra una nueva Pull Request.
   2. Ejecutar los siguientes pasos por este orden:
      1. `make lint`
      2. `make test`
      3. `make build`
      4. `docker-compose up -d`
      5. `curl --fail http://localhost:8080/api/`
3. Crear un pipeline de CD en Github Actions:
   1. Se ejecutará cada vez que se haga merge de una Pull Request.
   2. Ejecutar los siguientes pasos por este orden:
      1. Compilar imagen de Docker y enviarla al [container registry de Github](https://docs.github.com/es/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
      2. Usar docker-compose o alguna otra forma para conectarse al servidor y reemplazar la imagen actual por la que se acaba de subir.