# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  email = Faker::Internet.email
  password = 123123
  name = Faker::Name.name
  address = Faker::Address.street_address

  User.create(email: email, password: password, name: name, address: address)

  user_id = User.last.id
  animal_name = Faker::Creature::Dog.name
  gender = Faker::Gender.binary_type
  age = rand(1..12)
  size = Faker::Creature::Dog.size
  species = ["Dog", "Cat"].sample
  description = " A #{species}, #{age} years old and in need of a loving family. "

  Animal.create(user_id: user_id,
                name: animal_name,
                gender: gender,
                age: age,
                size: size,
                species: species,
                description: description)
end
