# Covid Vaccine Tracker
Find the vaccine availibility in a state

## How to Run
Install Ruby and RVM and do `bundle install` from the root. Then, run the following
```sh
$ ruby cowin.rb
```
If you want to edit params then you'll need to edit the `cowin.rb` file:
```ruby
# example
CowinVaccine.new(state_id: 32, dose: 1, age: 45, vaccines: ['COVAXIN'])
```

## The params that new method take are:
### Mandatory Param in Hash
* state_id(integer) : state code

### Optional Params in Hash
* dose(integer) : 1 or 2
* age(integer) : 18 or 45
* vaccine(array) : ['COVAXIN']

#### State Codes:
* Telangana - 32

## Output
<img width="459" alt="Screenshot 2021-06-15 at 8 55 40 AM" src="https://user-images.githubusercontent.com/853315/121988176-7fb1cc80-cdb7-11eb-8b5e-b338e2311f49.png">
