## OpenFlights 
### A flight reviews app built with Ruby on Rails and React.js

This app is intended to be a simple example of a CRUD app built with **Ruby on Rails** and **React.js** using **Webpacker**.

---
![OpenFlights Home](https://github.com/Don-PhDev/open-flights/blob/master/app/assets/images/index-demo.png?raw=true)
---
![OpenFlights Show](https://github.com/Don-PhDev/open-flights/blob/master/app/assets/images/show-demo.png?raw=true)


---

This app uses:

* Ruby version: `2.7.4`
* Rails version: `6.0.3.4`
* Database: `postgresql`
* React version: `16.12.0`
* React Hooks API
* React Context API

## Running it locally
- run `bundle exec rails db:prepare`
- run `npm install` or `yarn install`
- run `bundle exec rails s`
- in another tab run `./bin/webpack-dev-server` (optional) 
- in another tab run `sidekiq` (optional, but necessary for things like password reset emails)
- navigate to `http://localhost:3000`

## Environment Variables
If you want functionality like password reset emails to work locally, you'll need to set the following environment variables in `config/application.yml` with your own unique values:
```
ROOT_URL: http://localhost:3000
SENDGRID_API_KEY: xxxxxxxxxxxxxx
SENDGRID_USERNAME: xxxxxxxxxxxxxx
SENDGRID_PASSWORD: xxxxxxxxxxxxxx
DEFAULT_FROM_EMAIL: you@example.com
```

## Routes
```shell
             Prefix Verb   URI Pattern                           Controller#Action
               root GET    /                                     pages#index
    api_v1_airlines GET    /api/v1/airlines(.:format)            api/v1/airlines#index
                    POST   /api/v1/airlines(.:format)            api/v1/airlines#create
 new_api_v1_airline GET    /api/v1/airlines/new(.:format)        api/v1/airlines#new
edit_api_v1_airline GET    /api/v1/airlines/:slug/edit(.:format) api/v1/airlines#edit
     api_v1_airline GET    /api/v1/airlines/:slug(.:format)      api/v1/airlines#show
                    PATCH  /api/v1/airlines/:slug(.:format)      api/v1/airlines#update
                    PUT    /api/v1/airlines/:slug(.:format)      api/v1/airlines#update
                    DELETE /api/v1/airlines/:slug(.:format)      api/v1/airlines#destroy
     api_v1_reviews POST   /api/v1/reviews(.:format)             api/v1/reviews#create
      api_v1_review DELETE /api/v1/reviews/:id(.:format)         api/v1/reviews#destroy
                    GET    /*path(.:format)                      pages#index
```

---

## Api V2 (Graphql)

**Get Airlines#index**
```
query Airlines {
  airlines {
    id
    name
    imageUrl
    slug
    averageScore
    reviews {
      id
      title
      description
      score
    }
  }
}
```

**Get Airlines#show**
```
query Airline {
  airline(slug:) {
    id
    name
    imageUrl
    slug
    averageScore
    reviews {
      id
      title
      description
      score
    }
  }
}
```

**Create Review**
```
mutation {
  createReview(
    title: "test",
    description: "test",
    score: 1,
    airlineId: 1
  ) {
    id
    title
    description
    score
    airlineId
    error
    message
  }
}
```

**Destroy Review**
```
mutation {
  destroyReview(id:) {
    message
    error
  }
}
```
---

This README is still being written

---

## License
```
Copyright (c) 2022 Don-PhDev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
