# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
password = "111111"
User.create(username: 'tejas', password: password)
User.create(username: 'shreya', password: password)
User.create(username: 'shubham', password: password)
User.create(username: 'preety', password: password)
