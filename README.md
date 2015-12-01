# Twithetic

## About

## How to instal

First, clone the project
````
git clone https://github.com/alexandre025/Twithetic.git
````

The project use many environments variable in config/secrets.yml and config/database.yml
You has to defined them when you launch the server or use [Figaro](https://github.com/laserlemon/figaro) wich is included with the project.

Next, create the database and run the migrations or load the schema
````
rake db:create
rake db:schema:load
````

## Run the server in production mode

Never forget to precompile the assets :
```
rake assets:precompile
````

We use passenger in production mode, you can redefined it in the Gemfile.
Please refer to passenger documentation for more informations.