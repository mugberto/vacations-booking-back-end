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
Destination.create(name: 'Bora Bora', location: 'French Polynesia', image_url: 'https://www.portalmladi.com/wp-content/uploads/2015/10/bora-bora-odmor.png', price_per_day: 150)
Destination.create(name: 'Rome', location: 'Italy', image_url: 'https://parade.com/.image/t_share/MTkwNTc4Mzg4NTYyODE0ODQ0/colosseum-in-rome-and-morning-sun-italy.jpg',price_per_day: 100)
Destination.create(name: 'Gracier National Park', location: 'USA', image_url: 'https://www.doi.gov/sites/doi.gov/files/styles/social_media_1200x627/public/blog-post/thumbnail-images/glaciernpshanlin.jpg?itok=BlwMSQH5',price_per_day: 100)
User.create(username: 'User1', email: 'user@user', password:'123456', password_confirmation:'123456')
User.create(username: 'Admin', email: 'admin@admin', password:'123456', password_confirmation:'123456', admin: true)
Reservation.create(user_id: 1, destination_id: 1, startingDay:  "2021-12-01", endingDay: "2021-12-13")
puts("Seed finished...")
