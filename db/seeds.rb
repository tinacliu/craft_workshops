# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

LEVEL = ["Beginner", "Intermediate", "Advanced"]
CATEGORY = ["Calligraphy", "Ceramics", "Floristry", "Glass", "Jewellery", "Leather", "Paper", "Wood"]

User.destroy_all
Workshop.destroy_all
Booking.destroy_all

puts 'Welcome this will add some data to your db to play...'

puts 'adding user data.....'

5.times do
User.create!(
  email: Faker::Internet.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: 'secret',
  bio: Faker::Lorem.paragraph,
  )
end

puts 'User data added!'
puts 'Now adding Workshop data'

5.times do
  Workshop.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    category: CATEGORY.sample,
    level: LEVEL.sample,
    address: Faker::Address.full_address,
    price: rand(1..500),
    capacity: rand(1..50),
    date_time: Time.now - rand(1..500),
    owner: User.all.sample
    )
end

puts 'Workshop data added..'
puts 'creating bookings'

2.times do
  Booking.create!(
    workshop: Workshop.all.sample,
    owner: User.all.sample,
    num_guests: rand(1..50)
    )
end

puts 'all done!'



