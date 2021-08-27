# Sweater Weather
## About this Project
Sweater Weather is a fictional backend for an application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination and also search nearby breweries and what the current weather is for that location.
The front-end will communicate with the back-end through an API. The goal of this project is to build and expose that API in a way that satisfies the front-end team’s requirements using service oriented architecture.
## Table of Contents
[**Getting Started**](#getting-started) |
[**Versioning**](#versioning) |
[**Setup**](#setup) |
[**Running the tests**](#running-the-tests) |
[**Endpoints**](#endpoints) |
[**Examples**](#example-responses) |
[**Technologies Used**](#technologies-used) |
[**Authors**](#authors) |
[**Acknowledgements**](#acknowledgements)

## Getting Started
## Versioning
- Ruby 2.7.2
- Rails 5.2.6
## Setup
First you'll need to:
`bundle install`
`rails db{:drop,:create,:migrate}`

Next we install Figaro.
`bundle exec figaro install`

Figaro allows us to discretely place our API keys inside of our local files. Only you'll be able to see this file, which helps for keeping API keys secret.

Once you have Figaro installed, verify that you have an `application.yml` file in your `config` folder. The directory of the `application.yml` file should be `config/application.yml`.  For more documentation on Figaro, please see [here](https://github.com/laserlemon/figaro).

Congratulations! Basic setup is now complete.

This app will require you to get 3 API keys to place in your `application.yml` file.

1. [Register for the open weather API key](https://home.openweathermap.org/users/sign_up). Please be advised: Though you may receive your API key immediately, it may take a few hours for the key to be activated.

In your `application.yml` file put `FORCAST_API_KEY: <API KEY>`

2. [Register for the MapQuest's Geocoding API key](https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register)

In your `application.yml` file put `GEO_CODE_API_KEY: <API KEY>`

3. [Register for the Unsplash API key](https://unsplash.com/developers)

In your `application.yml` file put `UNSPLASH_API_KEY: <API KEY>`

That should take care of getting your weather, geocode, and background image API services!

And that should be all you need to finish installation!
## Running the tests
RSpec testing suite is utilized for testing this application.
 - Run the RSpec suite to ensure everything is passing as expected
`bundle exec rspec`
## Endpoints
The following are all API endpoints. Note, some endpoints have optional or required query parameters.
- All endpoints run off base connector http://localhost:3000 on local.
- Example responses can be seen after endpoints.

### Forecast:

| Method   | URI                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `GET`    | `/api/v1/forcast?location=<location>`   | Retrieves current, daily, and hourly forecast for location |

### Background Image:

| Method   | URI                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `GET`    | `/api/v1/backgrounds?location=<location>`| Retrieves appropriate background image for city|

### Breweries

| Method | URI                                        | Description                              |
| ------ | ------------------------------------------ | ---------------------------------------- |
| `GET`  | `/api/v1/breweries?location=<location>&quantity=<quantity>`    | Retrieves the local breweries and the current weather|

### Users:

| Method   | URI                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `POST`   | `/api/v1/users`                          |  Creates user in DB and returns user email and api_key  |
| `POST`   | `/api/v1/sessions`                       |  Creates a session and returns user email and api_key |

Request to create a user:
```
headers:
Content-Type: application/json
Accept: application/json

body:
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

Request to login a user:
```
headers:
Content-Type: application/json
Accept: application/json

body:
{
  "email": "whatever@example.com",
  "password": "password"
}
```

### Road Trips:

| Method   | URL                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `POST`   | `/api/v1/road_trip`                      |  Responds with road trip data including travel time and weather for destination at the eta |

Request:
```
headers:
Content-Type: application/json
Accept: application/json

body:
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}

```

## Example Responses

### Forecast for Denver, Colorado:

```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-06-12T22:07:37.000-05:00",
                "sunrise": "2021-06-12T06:31:29.000-05:00",
                "sunset": "2021-06-12T21:28:26.000-05:00",
                "temperature": 75.94,
                "feels_like": 75.16,
                "humidity": 41,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "few clouds",
                "icon": "02n"
            },
            "daily_weather": [
                {
                    "date": "2021-06-12",
                    "sunrise": "2021-06-12T06:31:29.000-05:00",
                    "sunset": "2021-06-12T21:28:26.000-05:00",
                    "max_temp": 92.84,
                    "min_temp": 61.84,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-06-13",
                    "sunrise": "2021-06-13T06:31:27.000-05:00",
                    "sunset": "2021-06-13T21:28:52.000-05:00",
                    "max_temp": 94.6,
                    "min_temp": 67.75,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-06-14",
                    "sunrise": "2021-06-14T06:31:26.000-05:00",
                    "sunset": "2021-06-14T21:29:16.000-05:00",
                    "max_temp": 99.03,
                    "min_temp": 70.83,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-06-15",
                    "sunrise": "2021-06-15T06:31:27.000-05:00",
                    "sunset": "2021-06-15T21:29:39.000-05:00",
                    "max_temp": 99.5,
                    "min_temp": 71.87,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-06-16",
                    "sunrise": "2021-06-16T06:31:30.000-05:00",
                    "sunset": "2021-06-16T21:30:01.000-05:00",
                    "max_temp": 101.7,
                    "min_temp": 75.27,
                    "conditions": "few clouds",
                    "icon": "02d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "22:00:00",
                    "temperature": 75.94,
                    "conditions": "Clouds",
                    "icon": "02n"
                },
                {
                    "time": "23:00:00",
                    "temperature": 76.23,
                    "conditions": "Clouds",
                    "icon": "02n"
                },
                {
                    "time": "00:00:00",
                    "temperature": 76.23,
                    "conditions": "Clouds",
                    "icon": "02n"
                },
                {
                    "time": "01:00:00",
                    "temperature": 75.38,
                    "conditions": "Clear",
                    "icon": "01n"
                },
                {
                    "time": "02:00:00",
                    "temperature": 74.01,
                    "conditions": "Clear",
                    "icon": "01n"
                },
                {
                    "time": "03:00:00",
                    "temperature": 71.82,
                    "conditions": "Clear",
                    "icon": "01n"
                },
                {
                    "time": "04:00:00",
                    "temperature": 70.39,
                    "conditions": "Clear",
                    "icon": "01n"
                },
                {
                    "time": "05:00:00",
                    "temperature": 69.57,
                    "conditions": "Clear",
                    "icon": "01n"
                }
            ]
        }
    }
}
```

### Background Image for Denver, CO

```
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "location": "denver,co",
            "image_url": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzkyNjF8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MjM2MDA5MDM&ixlib=rb-1.2.1&q=85",
            "credit": {
                "source": "unsplash.com",
                "author": "Ryan De Hamer",
                "author_profile": "https://unsplash.com/@rdehamer"
            }
        }
    }
}
```

### Breweries For Denver, CO

```
{
   "data': {
        "id": null,
        "type': "breweries",
        "attributes": {
            "forcast": {
                "summary": "clear sky",
                "temperature": 89.91
            },
            "breweries":[
                {
                    "id": 8962,
                    "name": "Black Beak Brewing",
                    "brewery_type": "planning"
                },
                {
                    "id": 8245,
                    "name": "Aero Craft Brewing",
                    "brewery_type": "planning"
                },
                {
                    "id": 13467,
                    "name": "Pints Pub Brewery and Freehouse",
                    "brewery_type": "brewpub"
                }
            ]
        }
    }
}
```

### Create a User or User login

```
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "6Qyioc4xNsnraU2xQG4AfRgY"
        }
    }
}
```

### Create a Road Trip
```
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Pueblo,CO",
            "travel_time": "01 hour(s) and 44 minutes",
            "weather_at_eta": {
                "temperature": 97.16,
                "conditions": "Clear"
            }
        }
    }
}
```
## Technologies Used
- Ruby
- Rails
- RSpec
- PostgreSQL
## Notable Gems Used
- faraday
- figaro
- jsonapi-serializer
## Authors
- **Joe Peterson**
  [LinkedIn](https://www.linkedin.com/in/joe-peterson-14718220b/)
  [GitHub](https://github.com/JoePeterson51)
## Acknowledgments

This project utilized the following external APIs: [OpenWeather One Call API](https://openweathermap.org/api/one-call-api), [MapQuest API](https://developer.mapquest.com/documentation/geocoding-api/), [UnplashAPI](https://unsplash.com/documentation).
- The photographer credit requirements for Unsplash can be found [here](https://help.unsplash.com/en/articles/2612337-do-i-have-to-give-credit-to-a-photographer-when-i-use-their-photo)
