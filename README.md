# Documentacion para empezar la BBDD 

Primero lo que tendremos que hacer sera crear dentro de PostgreSQL la base de datos con el nombre de App Adminstration

> CREATE DATABASE app_administration

Luego tenemos que crear el usuario con el que nos vincularemos a la app

> CREATE USER uah WITH PASSWORD 'uah2021';

Una vez ya hayamos creado la base de datos y el usuario solo nos queda ejecutar el **initial_script.sql** dentro de PostgreSQL y darle los permisos al usuario