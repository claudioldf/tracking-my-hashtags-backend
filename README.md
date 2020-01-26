# About
The project is a backend API application build over Ruby on Rails framework, where we can tracking messages on Twitter filtering by hashtags.

The API has the following features:
- Endpoint to create/remove hashtag
- Endpoint to fetch the twitter messages based on the the hashtag that you added or filtered.

Demo: https://tracking-my-hashtags.herokuapp.com/

There is an frontend application build using Angular 7, and you can check it on: https://github.com/claudioldf/tracking-my-hashtags-frontend

# General
  * Ruby version: 2.7

  * System dependencies:
    - Ruby
    - Rails
    - Docker / docker-compose (optional)


# Configuration


## Docker (build and run over docker-compose)
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


## Database creation
Enter the following commands to setup the application database:
```
docker-compose run app_backend rake db:create
docker-compose run app_backend rake db:migrateash
```

## Database initialization
TODO

## How to run the test suite
```bash
docker run -it app_backend rspec
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
  https://tracking-my-hashtags.herokuapp.com/hashtags
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
  https://tracking-my-hashtags.herokuapp.com/hashtags
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
  https://tracking-my-hashtags.herokuapp.com/messages
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