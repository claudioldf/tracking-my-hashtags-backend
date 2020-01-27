# About
The project is a backend API application build using Ruby on Rails framework, where we can tracking messages on Twitter filtering by hashtags.

The API has the following features:
- Endpoint to create/remove hashtag
- Endpoint to fetch the twitter messages based on the the hashtag that you added or filtered.

Demo: https://tracking-my-hashtags-backend.herokuapp.com/messages
Complete Demo: (Backend+Frontend): https://tracking-my-hashtags-frontend.herokuapp.com/messages

There is an frontend application build using Angular 7, and you can check it on: https://github.com/claudioldf/tracking-my-hashtags-frontend

This project uses:
  - Ruby 2.7.0
  - Rails 6.0.2
  - Docker and docker-compose

<br/>

# Configuration

## Docker (opcional, but recommended)
Firstly you need docker and docker-compose installed on the environment that you need to run this app.
Check:
- https://docs.docker.com/install/
- https://docs.docker.com/compose/install/

If you already have or already setup docker environment, you can just build de images and turn it up.
Thus, run this command on terminal to proceed:
```bash
# Build the docker image
docker-compose build

# Turn the containers up (it also will pull docker postgres images if you haven't from the official repository)
docker-compose up
```

## Application setup
### 1. Setup dotenv files:
Copy .env.sample file to .env and .env.test.sample to .env.test, and change the keys/tokens/secrets to your twitter access data
```bash
cp .env.sample .env
cp .env.test.sample .env
```

### 2. Create the database and runs the migrations
```bash
# 1. Create de development and testing database
# If you have docker:
docker exec -it app_backend rails db:create
# Otherwise
bundle exec rails db:create


# 2. Runs migrations
# If you have docker:
docker exec -it app_backend rails db:migrate
# Otherwise
bundle exec rails db:migrate
```

**NOTE** If you remove the app_database container, the data persisted on database will be loose, because we didn't build the docker volume. In order to persist data you have to create a volume. See: https://hub.docker.com/_/postgres

### 3. Run the test suite
```bash
docker exec -it app_backend bundle exec rspec
```

<br/>
<br/>

# API Endpoints
## **POST /hashtags**
### Create a new hashtag
### Body Request Parameters:
  * **hashtag**: Entity node
    * **name**: Hashtag name (symbol "#" is optional, it will be added automatically if not present)

### Request example:
```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"hashtag":{"name": "ruby"}}' \
  http://localhost:3000/hashtags
```
### Response example:
```json
{
  "id":1,
  "name":"#ruby",
  "created_at":"2020-01-26T16:04:52.257Z",
  "updated_at":"2020-01-26T16:04:52.257Z"
}
```

<br/>

## **GET /hashtags**
### Return the list containing all created hashtags

### Request example:
```bash
curl -X GET \
  -H "Content-Type: application/json" \
  http://localhost:3000/hashtags
```
### Response example:
```json
[
  {
    "id":1,
    "name":"#ruby",
    "created_at":"2020-01-26T16:04:52.257Z",
    "updated_at":"2020-01-26T16:04:52.257Z"
  }
]
```

<br/>

## **GET /messages** 
### Return the list containing all messages that contains one or more hashtags on the message text

### Request example:
```bash
curl -X GET \
  -H "Content-Type: application/json" \
  http://localhost:3000/messages
```

### Response example:
```json
[
  ...,
  {
    "screen_name":"myscreenname",
    "text":"A dynamic, open source programming language with a focus on simplicity and productivity #ruby #rails",
    "published_at":"2020-01-22T21:30:00.000Z",
    "user":{
      "followers_count":97,
      "profile_image_uri":"http://pbs.twimg.com/profile_images/1097101179329363968/k5XWHGCb_normal.png"
    }
  },
  ...
]
```
