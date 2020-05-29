== README

# NoteKeeping System

This is a simple ruby on rails application which displays a bunch of notes created by the user. Users can register or login. User can create a note, he will become the owner of the note. He can share his notes with other users, and add them as a contributor or reader.
Permissions are as follows-
Owner of note - create, read, update, delete and share
Contributor of note - read and update
Reader of note - only read

## Dependencies
            * Ruby Version    : 2.7.0
            * Rails           : 6.0.3.1
            * Bootstrap
            * RSpec

## Installation
            $ git clone git@github.com:MamtaBobal/notekeeping-system.git
            $ bundle install
            $ rake db:create
            $ rake db:migrate
            $ rake db:seed
            $ rails server

## Tests
            $ rspec

## Credentials
###### Email: test@gmail.com
###### Password: 123456

## Heroku link
###### https://online-notekeeping-system.herokuapp.com/users/sign_in
