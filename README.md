## Bookmark Manager
#### Technologies: Ruby, Sintra, PostgreSQL, DataMapper, Rspec, Capybara, HTML, CSS
### Week 4 pair programming challenge for [Makers Academy] (http://www.makersacademy.com)
[Outline](#outline) | [User Stories](#user-stories) | [Gems](#gems) | [Usage Instructions](#usage-instructions) 

## Brief
You're going to build a bookmark manager. A bookmark manager is a website to maintain a collection of URLs. You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse links other users have added.

## Outline
This project was my first experience of using a database to persist information.  I gained a good baseline understanding of CRUD methods which I was able to put to use in later projects.

## User Stories
```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of links on the homepage

As a time-pressed user
So that I can quickly find web sites I recently bookmarked
I would like to see links in descending chronological order

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to my bookmark manager

As a time-pressed user
So that I can organise my many links into different categories for ease of search
I would like to add tags to the links in my bookmark manager

As a time-pressed user
So that I can quickly find links on a particular topic
I would like to filter links by tag
```

## Gems
```ruby
gem 'rspec'
gem 'sinatra'
gem 'rspec-sinatra'
gem 'capybara'
gem 'data_mapper'
gem 'dm-postgres-adapter'
gem 'rake'
gem 'bcrypt'
gem 'sinatra-flash'

group :test do
  gem 'database_cleaner'
end
```

## Usage Instructions
* clone the repo and run bundle
```shell
$ git clone https://github.com/samjones1001/bookmark_manager
$ cd rps-challenge
$ rvm 2.3.0
$ bundle
```
* run tests
```shell
$ rspec
```
* start up sinatra
```shell
$ ruby app.rb
```
* in your browser, navigate to http://localhost:4567/ 
