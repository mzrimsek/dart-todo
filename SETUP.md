# What to Install
1. [Dart](https://www.dartlang.org/install)
2. [PostgreSQL](https://www.postgresql.org/download/)

# Databases
Run the following commands in psql

## Application Database
Create the database
```
CREATE DATABASE dart_todo;
```

Create admin user - this user will run our database migrations.
```
CREATE USER dart_todo_admin;
ALTER USER dart_todo_admin WITH PASSWORD 'dart_todo';
GRANT ALL ON DATABASE dart_todo TO dart_todo_admin;
```

Create application user - this user will be used by the app to interact with the database.
```
CREATE USER dart_todo_app;
ALTER USER dart_todo_app WITH PASSWORD 'dart_todo';
GRANT CONNECT ON DATABASE dart_todo TO dart_todo_app;
```

Connect to the database and update permissions for application user.
```
ALTER DEFAULT PRIVILEGES FOR ROLE dart_todo_admin GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON TABLES TO dart_todo_app;
ALTER DEFAULT PRIVILEGES FOR ROLE dart_todo_admin GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO dart_todo_app;
```

## Test Database
This database will be used to run tests against.
```
create database dart_test;  
create user dart with createdb;  
alter user dart with password 'dart';  
grant all on database dart_test to dart;  
```

# Run Project
1. Clone repository   
```git clone https://github.com/mzrimsek/dart-todo.git```
2. Install dependencies   
```pub get```
3. Build project   
```pub build```
4. Start server   
```dart bin/start.dart```

## Testing
```pub run test```