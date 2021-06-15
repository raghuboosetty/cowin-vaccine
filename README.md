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
* state_id(integer) : 1 to 37 (state code list below)

### Optional Params in Hash
* dose(integer) : 1 or 2
* age(integer) : 18 or 45
* vaccine(array) : ['COVAXIN']

#### State Codes(state_id):
* 1  : Andaman And Nicobar Islands
* 2  : Andhra Pradesh
* 3  : Arunachal Pradesh
* 4  : Assam
* 5  : Bihar
* 6  : Chandigarh
* 7  : Chhattisgarh
* 8  : Dadra And Nagar Haveli
* 9  : Delhi
* 10 : Goa
* 11 : Gujarat
* 12 : Haryana
* 13 : Himachal Pradesh
* 14 : Jammu And Kashmir
* 15 : Jharkhand
* 16 : Karnataka
* 17 : Kerala
* 18 : Ladakh
* 19 : Lakshadweep
* 20 : Madhya Pradesh
* 21 : Maharashtra
* 22 : Manipur
* 23 : Meghalaya
* 24 : Mizoram
* 25 : Nagaland
* 26 : Odisha
* 27 : Puducherry
* 28 : Punjab
* 29 : Rajasthan
* 30 : Sikkim
* 31 : Tamil Nadu
* **32 : Telangana**
* 33 : Tripura
* 34 : Uttar Pradesh
* 35 : Uttarakhand
* 36 : West Bengal
* 37 : Daman And Diu

## Output
<img width="459" alt="Screenshot 2021-06-15 at 8 55 40 AM" src="https://user-images.githubusercontent.com/853315/121988176-7fb1cc80-cdb7-11eb-8b5e-b338e2311f49.png">
