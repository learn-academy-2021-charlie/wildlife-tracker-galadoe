# README

##Story: As a developer I can create an animal model in the database. An animal has the following information: common name, latin name, kingdom (mammal, insect, etc.).##
```ruby
rails g resource Animal common_name:string latin_latin kingdom:string
rails db:migrate
```

##Story: As the consumer of the API I can see all the animals in the database.
Hint: Make a few animals using Rails Console
in the rails console
```ruby
Animal.create common_name: 'Cheetah', latin_latin: 'Acinonyx jubatu
s', kingdom: 'Animalia'
Animal.create common_name:'dolphin', latin_latin: 'Delphinus', king
dom: 'Animal'
Animal.create common_name: 'Frog', latin_latin: 'Anura', kingdom: '
amphibian'
Animal.create common_name: 'Eagle', latin_latin: 'Aquila', kingdom:
'Animalia'
```
in the animal controller
```ruby
def index
  animals = Animal.all
  render json: animals
end
```
##Story: As the consumer of the API I can update an animal in the database.
in the animal controller
```ruby
def show
  animal = Animal.find(params[:id])
  render json: animal
end
```
##Story: As the consumer of the API I can destroy an animal in the database.
in the animal controller
```ruby
def destroy
  animal = Animal.fin(params[:id])
  animal.destroy
  render json: animal
end
```
##Story: As the consumer of the API I can create a new animal in the database.
in the animal controller
```ruby
def create
  animal = Animal.create(animal_params)
  if animal.valid?
    render json: animal
  else
    render json: animal.errors
  end
end
```
this is in the controller (animal) as well, but its the very last thing
```ruby
private
def animal_params
  params.require(:animal).permit(:common_name, :latin_latin, :kingdom)
end
```
##Story: As the consumer of the API I can create a sighting of an animal with date (use the datetime datatype), a latitude, and a longitude.
Hint: An animal has_many sightings. (rails g resource Sighting animal_id:integer ...) *this is active record associations
first, you need to create a new model
```ruby
rails g resource Sighting animal_id:integer date:datetime latitude:float longitude:float
rails db:migrate
```
next, in the animal model (it *sighting will be pluralized)
```ruby
class Animal < ApplicationRecord
  has_many :sightings
end
```
next, in the sighting model
```ruby
class Sighting < ApplicationRecord
  belongs_to :animal
end
```

##Story: As the consumer of the API I can update an animal sighting in the database.
first, you want to create an animal sighting before you can update it
in sighting
in the sighting controller
```ruby
  def create
    sighting = Sighting.find(params[:id])
    if sighting.valid?
      render json: sighting
    else
      render json: sighting.errors
  end
```
in the sighting controller create a private that holds the params
```ruby
private
def sighting_params
  params.require(:sighting).permit(:animal_id, :date, :latitude, :longitude)
end
```
Story: As the consumer of the API I can destroy an animal sighting in the database.
Story: As the consumer of the API, when I view a specific animal, I can also see a list sightings of that animal.
Hint: Checkout the Ruby on Rails API docs on how to include associations.
Story: As the consumer of the API, I can run a report to list all sightings during a given time period.
Hint: Your controller can look like this:
