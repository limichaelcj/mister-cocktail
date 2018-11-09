# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

ingredients_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients_data = JSON.parse(open(ingredients_url).read)

puts "Seeding database..."

puts "Adding common ingredients"

# preset ingredients
ingredients_data['drinks'].each do |item|
  Ingredient.create(name: item['strIngredient1'])
end

puts "Faking cocktails and doses..."

rand(6..10).times do
  cocktail = Cocktail.new(name: Faker::Coffee.blend_name,
                             description: Faker::Lovecraft.sentence)
  cocktail.remote_photo_url = 'https://source.unsplash.com/collection/1990254'
  cocktail.save!
  Ingredient.all.sample(rand(3..6)).each do |ingredient|
    dose = Dose.create(cocktail: cocktail,
                       description: Faker::Measurement.volume,
                       ingredient: ingredient)
  end
  rand(3..6).times do
    Review.create(cocktail: cocktail,
                  rating: rand(1..5),
                  comment: Faker::HowIMetYourMother.quote)
  end
end

puts "Seeding complete."
