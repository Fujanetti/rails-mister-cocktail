# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all
puts "Ingredients reset"
URL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list" 

serialized_data = open(URL).read
drinks = JSON.parse(serialized_data)

(0..15).each do |n|
  Ingredient.create!(name: drinks["drinks"][n]["strIngredient1"])
  puts n + 1
end
