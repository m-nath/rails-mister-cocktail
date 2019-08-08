# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.destroy_all
require 'JSON'
require 'open-uri'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
ingredients_list = JSON.parse(json)
ingredients_list['drinks'].each do |ingredient_list|
  p ingredient_list["strIngredient1"]
  Ingredient.create!(name: ingredient_list["strIngredient1"])
end
