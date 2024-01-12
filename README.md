# BookMart: Online Book Shopping System (Program 2: RoR - ashon-kajadhav)

## Local Setup
1. Install Ruby ***3.2.0***.
2. Clone repo, cd into it and run ```bundle install```
3. Run ```rails assets:precompile```
4. Run ```rails db:migrate```
5. Run ```rails db:seed``` to create admin user via seeding.
6. Run ```rails s``` to start server.
7. Go to ```localhost:3000``` to access shop and cart functions.

## Demo
[<img src="https://i.ytimg.com/vi/wCl_MHH4gtA/maxresdefault.jpg" width="50%">](https://www.youtube.com/watch?v=wCl_MHH4gtA "CSC 517 RoR BookMart")

## Dockerized Setup
[Docker Setup Details](https://docs.google.com/document/d/1mT0SWLksjkwcW6OdbD7--2JyYbT0aA0bocc3S91aAbo/edit)
## Admin Creds & App Feature Testing
[App Behavior Details](docs/app-behavior-details)
## Testing
1. After running local setup steps, run ```rspec --format doc``` to run tests for the model and controller

The test files run for RSpec are ```spec/controllers/reviews_controller_spec.rb``` and ```spec/models/book_spec.rb```