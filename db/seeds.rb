# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
Item.find_or_create_by!(name: 'Coffee::large', price: 200, count: 3)
Item.find_or_create_by!(name: 'Coffee::medium', price: 100, count: 2)
Item.find_or_create_by!(name: 'Coffee::small', price: 50, count: 5)
