# README

# Indexing Api

This is a simple api built with Rails that provides the following endpoints:

1- Takes `url` as a param, gets the content of the page, parses it and store the contents of h1, h2 and h3 and the links.

2- Lists the urls and content stored in the database


## Technology stack
- Ruby 2.2 at least

- Rails 5.0

- PostgreSQL

- Rspec

## Running Locally
Make sure you have [Ruby](https://www.ruby-lang.org), [Bundler](http://bundler.io), and [PostgreSQL](https://www.postgresql.org/) installed.

```sh
git clone git@github.com:imouaddine/indexing_api.git
cd indexing_api
bundle
rake db:setup
```

## How to consume the api

### To receive a url and indexes its content
```sh
curl -X POST  -F "url=http%3A%2F%2Fwww.example.com%3Fss%3D2" "http://localhost:3000/pages"
```

Make sure the url param is well encoded. You can use `CGI::escape(url)` if you're using Ruby to generate the request.


### To get all urls
```sh
curl -X GET  "http://localhost:3000/pages"
```



