# makersbnb

This is our first group project at Makers Academy, which we built between 18th and 22nd June. We are: [Daniel Ridgway](https://github.com/ridginald), [Diego Fontecilla](https://github.com/diegofontecilla), [Rahul Rakshit](https://github.com/rahul-rakshit) and [Simone Smith](https://github.com/simone-smith). The specification was as follows:

### Headline specifications
- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night.

### How to use
* Install and set up PostrgreSQL on your machine
* Clone this repo to your local machine: `git clone https://github.com/simone-smith/makersbnb`
* Open the directory: `cd makersbnb`
* Run bundle: `bundle install`
* Set up the databases: `rake setup`
* Run the tests: `rspec`
* Run the server: `rackup`
* Navigate to localhost:9292 to use the app in the browser

### MVP
Very basic classified adverts for apartment rental.

- Start on the home page
- There are text boxes called ‘Title’, ‘Owner’ and a submit button
- User enters title and owner, clicks submit
- User is redirected back home
- Home page displays all properties added

We achieved our MVP by the end of day 1.

### User Stories
```
User story 1
As a user
So that I can advertise my property
I want to add my property to the list of properties
```
```
User story 2
As a user
So that I can view my own advert
I want to see a list of available properties
```
```
User story 3
As a user
So that I can maximise profit from my properties
I want to be able to list more than one property for rent
```
```
User story 4
As MakersBnB
So that I can regulate listings
I want users to have to sign up before they can list an apartment
```
```
User story 5
As MakersBnB
So that multiple users can use my site
I want to enable users to sign in and out
```
```
User story 6
As a user
So that I can make my listing more interesting
I want to be able to add a description and a price per night
```
```
User story 7
As a user
So as to avoid booking conflicts
I want to specify available dates for my listing
```
```
User story 8
As a user
So that I can book a property
I want to be able to send a booking request to the host
```

### Technologies used
* BCrypt (3.1.12)
* Bootstrap (4.1.1)
* Capybara (2.17.0)
* PostgreSQL (1.0.0) (and TablePlus for GUI)
* Rake (12.3.0)
* RSpec (3.7.0)
* Ruby (2.5.0)
* Sinatra (2.0.3)
* Sinatra-flash (0.3.0)

### Future improvements
- Booking requests should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.
- Users should receive an email whenever one of the following happens:
 - They sign up
 - They create a space
 - They update a space
 - A user requests to book their space
 - They confirm a request
 - They request to book a space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
 - A user requests to book their space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.
