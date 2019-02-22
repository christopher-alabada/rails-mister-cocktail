require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Getting json from https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read

ingredients = JSON.parse(json)['drinks']

puts "Loop ingredients"
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
  puts "Created #{ingredient['strIngredient1']}"
end

# Add club soda
Ingredient.create(name: 'Club soda')
puts "Created Club soda"

# Add Ginger syrup
Ingredient.create(name: 'Ginger syrup')
puts "Created Ginger syrup"

# Add Angostura bitters
Ingredient.create(name: 'Angostura bitters')
puts "Created Angostura bitters"

# Add Tonic
Ingredient.create(name: 'Tonic')
puts "Created Tonic"

puts "Done"
