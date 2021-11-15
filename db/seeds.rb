# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Destination.destroy_all
User.destroy_all
Reservation.destroy_all

puts("Seed start...")
Destination.create(name: 'Bora Bora', location: 'French Polynesia', image_url: 'https://res.cloudinary.com/dqdrsilxz/image/upload/v1636638534/bora-bora-island_tcyoev.jpg', price_per_day: 150)
Destination.create(name: 'Rome', location: 'Italy', image_url: 'https://res.cloudinary.com/dqdrsilxz/image/upload/v1636638500/Rome-Italy_isahvk.jpg',price_per_day: 100)
Destination.create(name: 'Gracier National Park', location: 'USA', image_url: 'https://res.cloudinary.com/dqdrsilxz/image/upload/v1636573679/sample.jpg',price_per_day: 100)
User.create(username: 'User1', email: 'user@user', password:'123456', password_confirmation:'123456')
Reservation.create(user_id: 1, destination_id: 1, startingDay:  "2021-12-01", endingDay: "2021-12-13")
puts("Seed finished...")