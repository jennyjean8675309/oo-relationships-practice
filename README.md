## Step 1. Understand (and draw out) model relationships
 -- Passenger, Driver, Ride
    -- passenger has many rides
    -- driver has many rides
    -- ride belongs to a passenger and a driver (is initialized with a distance (as a float))

    Following the *single source of truth* rule, determine which model keeps track of its relationship(s) with the other model(s)

## Step 2. Create the files you need
 -- Convention for model file names 
    -- lowercase
    -- if more than one word, snake_case 
    -- singularize model names (i.e. cat vs. cats)
    -- .rb extension

    passenger.rb, driver.rb, ride.rb

## Step 3. Define classes and initialize methods (using what you've outlined in Step 1.)
 -- Which model is responsible for keeping track of its relationship(s) with the other model(s)
 -- Test your code!

## Step 4. Building out a test file
 -- All of your model files need to communicate with one another somehow. In this repository, that connection has already been created for you in config/environment.rb...

                    require_all 'app'   --> this line is saying 'require everything in the /app folder'

 -- You will write your test code in tools/console.rb, which is requiring the environment.rb file we just looked at...

                    require_relative '../config/environment.rb'

 -- run this file using 

                    ruby tools/console.rb 

## Step 5. Testing methods (it's really up to you!)
 -- Faking a test file - all tests, no matter which testing framework you use, include code that evaluates to either true or false, to indicate whether a test passes or fails (these are test assertions)

## Step 6. Build out deliverables in README one. by. one. ...and then test them... one. by. one.
 -- How do we know if the method we're being asked to build is an instance method, or a class method?
 -- We're at the point now where we're building out a lot of code that relies on a lot of *other* code in order to work - DON'T MAKE ASSUMPTIONS!

    Passenger should have an instance method, #drivers, that returns all passengers a driver has ridden with - where is the *single source of truth* for that relationship? --> Ride!!!
    Ride now needs a class method that keeps track of all rides that we create so we can use it in Passenger

    - how do we create a class variable to keep track of our instances of Ride?
    - how do we create a class method that will return all of our rides?
    - at what point in our code should we be adding instances of Ride to that array?

 Test it!

## Other Stuff to Keep in Mind...
 -- Be sure to check for *false* test cases
 -- Your first goal is to get everything working, but once you do, check back through your code and see if there are any places to refactor (is your code DRY? can you create some helper methods?)







