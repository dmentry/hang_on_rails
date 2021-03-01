# Hangman
Guess the word before your man gets hung! This version is developed on Rails.

# Try application
https://hangmanrails.herokuapp.com

# System
Ruby 2.7.2

Rails 6.0.3

# Installation
git clone git@github.com:dmentry/hangman_rails.git

## Before run
bundle && bundle exec rake db:migrate

## Run locally server
bundle exec rails s

## Open in browser
http://127.0.0.1:3000

## Add new words
Now new words can be added into DB only manually via console
bundle exec rails c
