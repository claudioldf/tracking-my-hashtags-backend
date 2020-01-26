# README

## About
The project is a backend API application build over Ruby on Rails framework, where we can tracking messages on Twitter filtering by hashtags.

The API has the following features:
- Endpoint to create/remove hashtag
- Endpoint to fetch the twitter messages based on the the hashtag that you added or filtered.

Demo: https://tracking-my-hashtags.herokuapp.com/

There is an frontend application build using Angular 7, and you can check it on: https://github.com/claudioldf/tracking-my-hashtags-frontend

## General
  * Ruby version: 2.7

  * System dependencies:
    - Ruby
    - Rails
    - Docker / docker-compose (optional)


## Configuration


### Docker (build and run over docker-compose)
In order to run this project, you should enter on terminal:
```bash
# Build the docker image
docker-compose build

# Turn the containers up
docker-compose up

# Runs bundle commands:
# Eg.:
docker-compose run app_backend rake db:create
```


### Database creation
Enter the following commands to setup the application database:
```
docker-compose run app_backend rake db:create
docker-compose run app_backend rake db:migrateash
```

### Database initialization
TODO

### How to run the test suite
```bash
docker run -it app_backend rspec
```
