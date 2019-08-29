# Movies API

Heroku URL: 

## Running locally

1. Clone this repository `git clone repourl`
2. Run postgres locally
3. Update your local database credentials in `app.rb` file
4. Run migrations with `bundle exec sequel -m db/migrations postgres://localhost/#{your database name}`
5. Run the project with `ruby app.rb`


## Run tests
Execute `rspec` in root directory


# API DOC

## Create a movie `/movies`
```
URL: herokuurl.com/movies
TYPE: POST
PARAMS: 
    {
     "name": "A movie name",
     "description": "Lorem ipsum",
     "days": "[1, 2, 3]",
     "cover": cover file
    }
RESPONSE:
  {
    "id": 23
  }
```
## Get all movies `/movies`

```
URL: herokuurl.com/movies
TYPE: GET
PARAMS:
  day: integer

Example: herokuurl.com/movies?day=2
```

## Create Booking `/bookings`
```
URL: herokuurl.com/bookings
TYPE: POST
PARAMS: 
    {
     "date": "2019-08-30",
     "movie_id": 1
    }
RESPONSE:
  {
    "id": 23
  }
```
## Get bookings between dates `/bookings`

```
URL: herokuurl.com/bookings
TYPE: GET
PARAMS:
  start_date: string
  end_date: string
  
Example: herokuurl.com/bookings?start_date=2019-08-30&end_date=2019-08-30
```