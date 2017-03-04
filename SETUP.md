# What to Install
1. [Dart](https://www.dartlang.org/install)
2. [PostgreSQL](https://www.postgresql.org/download/)

# Databases
Run the following commands in PostgreSQL. Using pgAdmin is recommended.

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
CREATE DATABASE dart_test;  
CREATE USER dart WITH CREATEDB;  
ALTER USER dart WITH PASSWORD 'dart';  
GRANT ALL ON DATABASE dart_test TO dart;  
```

# Run Project
1. Clone repository   
```git clone https://github.com/mzrimsek/dart-todo.git```
2. Install dependencies   
```pub get```
3. Activate aqueduct globally (you may have to add this to your path after it finishes)  
```pub global activate aqueduct 1.0.4```
4. Run database migrations  
```aqueduct db upgrade```
5. Build project   
```pub build```
6. Start server   
```dart bin/start.dart```

# Testing
Running all the tests is easy.  
```pub run test```