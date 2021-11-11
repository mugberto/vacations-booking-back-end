# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
   User.create(username: 'dan', email: 'dan@yahoo.com', encrypted_password: '23453me')
    User.create(username: 'jon', email: 'jon@gmail.com', encrypted_password: '234don')

   puts 'completed users creation'