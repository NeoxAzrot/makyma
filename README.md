# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

2.6.5

* System dependencies

* Configuration

* Database creation

bundle exec rake db:create
bundle exec rake db:migrate

* Database initialization

psql 
DROP DATABASE "Makyma_development";
\q
heroku pg:pull postgresql-aerodynamic-10743 Makyma_development --app makyma


* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

heroku

* ...
