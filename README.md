# README

## SETUP

# Create your .env file

Remember to setup your env file for this project.

Example:

```
DATABASE_NAME=rails_database
DATABASE_USER=admin
DATABASE_PASSWORD=123
DATABASE_HOST=rails-db
```

# Create your db

- Make sure your containers are up and running

- Then:

```
docker exec rails-app bundle exec rake db:create
docker exec rails-app bundle exec rake db:migrate
```
