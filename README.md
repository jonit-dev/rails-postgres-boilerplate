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

- Enter rails-app container:

```
docker exec -it rails-app sh
```

- Then, run:

```
bundle exec rake db:create
bundle exec rake db:migrate
```
