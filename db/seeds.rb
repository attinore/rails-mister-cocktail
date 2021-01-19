require 'json'
require 'open-uri'

Ingredient.destroy_all

puts 'Creating cocktails.......'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list = open(url).read
ingredients = JSON.parse(list)

ingredients['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end
puts "Created #{Ingredient.count} ingredients"
