# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Ensure there are users in the database
if User.count.zero?
  puts "Creating default user"
  User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')
end

user = User.first

categories = ['Jeans', 'Shorts', 'Blouse', 'T-shirt', 'Dress', 'Skirt', 'Sweater', 'Jacket', 'Accessories', 'Shoes']
brands = ['Brand A', 'Brand B', 'Brand C', 'Brand D']

20.times do |i|
  ListedItem.create!(
    name: "Item #{i + 1}",
    description: "Description for item #{i + 1}",
    starting_price: rand(5.0..50.0).round(2),
    price: rand(5.0..50.0).round(2),
    brand: brands.sample,
    category: categories.sample,
    end_time: Time.now + rand(1..10).days,
    user: user
  )
end

puts "Created 20 listed items"
