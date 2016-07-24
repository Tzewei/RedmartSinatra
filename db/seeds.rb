require './models/user'
require 'faker'

# seeds.rb is a way of automating the population of the database with testing data.

(0..10).each do |i|
    User.create(
      name: Faker::StarWars.character,
      email: Faker::Internet.email,
      address: Faker::Address.street_address,
      cc_number: Faker::Number.number(7)
    )
end
