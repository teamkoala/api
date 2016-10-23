# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

item = Item.find_or_create_by!(name: 'Coffee::large', price: 200, count: 3)
item.pretty_name = 'Large Coffee'
item.save

item = Item.find_or_create_by!(name: 'Coffee::medium', price: 100, count: 2)
item.pretty_name = 'Medium Coffee'
item.save

item = Item.find_or_create_by!(name: 'Coffee::small', price: 50, count: 5)
item.pretty_name = 'Small Coffee'
item.save

Order.all.each do |order|
  LineItem.create(item: Item.first, order: order)
end
