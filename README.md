
##Recordbox Reviews - Ruby on Rails App


##Introduction

This is a CRUD (Create, Read, Update and Delete) web app with a back-end built on Ruby on Rails and the front-end built with Bootstrap. This is my third project for the Flatiron School, Web Developer program.

This app helps users keep track of their vinyl record collection (or Recordbox) and allows for other users to comment and review the records in the collection.

A user must be logged in and authenticated in order to edit and/or delete his/her collection and review records. Also a logged in user can only add or edit their own content. For user authentication, username and password validators were created with a combination of Ruby and RegEx.


##Installation and Usage

-- Must have Rails installed! --

Github repository of the project: https://github.com/asabogal/recordbox-reviews

After cloning the repository:

$ bundle install

Run migrations:

$ rake db:migrate

Host on local server:

$ rails s

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/asabogal/recordbox-reviews. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
