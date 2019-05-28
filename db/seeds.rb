require 'faker'

LEVEL = ["Beginner", "Intermediate", "Advanced"]
CATEGORY = ["Calligraphy", "Ceramics", "Floristry", "Glass", "Jewellery", "Leather", "Paper", "Wood"]
TITLES = ['Spoon carving for beginners', 'Green wood chair making in Suffolk', 'Don White Woodturning Experience']

PHOTOS_URLS = ['https://res.cloudinary.com/dduochwyb/image/upload/v1559013354/craftsman_ave_55db18711ba0f_xpedxm.jpg', 'https://res.cloudinary.com/dduochwyb/image/upload/v1559013355/mokuchi_woodworking_studio_54ebc348b9865_uwngg9.png',
'https://res.cloudinary.com/dduochwyb/image/upload/v1559013354/alzerina_jewelry_5967105671bec_d5oezi.jpg', 'https://res.cloudinary.com/dduochwyb/image/upload/v1559013355/american_school_of_flower_design_57aea831259af_nbw8vv.png']
index_counter = 0

puts 'Clearing data....'
Booking.destroy_all
Photo.destroy_all
Workshop.destroy_all
User.destroy_all

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

workshop_attributes = [
  {
    name:         'Introduction to Modern Woodworking',
    description:  'Students will make a small table suitable for use as a planter or side table. It will be constructed out of oak using half-lap joints to create a flush assembly. The style is contemporary and minimalist, so it should fit well with any existing interior design.',
    category:      CATEGORY[-1],
    address:       Faker::Address.full_address,
    price:         rand(1..500),
    capacity:      rand(1..50),
    date_time:     Date.today + rand(1..30),
    owner_id:      User.all.sample.id,
    level:         LEVEL.sample
  },
  {
    name:         'Japanese Woodworking Introduction',
    description:  'You will gain a broad understanding of how Japanese woodworking distinguishes itself from Western approaches during this two hour talk and demonstration. The session will include an overview of traditional hand tools used in a range of work scale, from making small objects to full size timber frame building.',
    category:      CATEGORY[-1],
    address:       Faker::Address.full_address,
    price:         rand(1..500),
    capacity:      rand(1..50),
    date_time:      Date.today + rand(1..30),
    owner_id:       User.all.sample.id,
    level:          LEVEL.sample
  },
  {
    name:         'Jewelry Making',
    description:  'Are you looking to put your creativity in to action? Then the jewelry class is definitely for you. Either if you are looking to make professional jewelry or just for a hobby then you have find the right jewelry class.
      Come and enjoy this 90-minute fabulous, in-depth Jewelry making class where you will learn how to make unique and gorgeous jewelry for everyday wear and those special nights out.',
    category:      CATEGORY[4],
    address:       Faker::Address.full_address,
    price:         rand(1..500),
    capacity:      rand(1..50),
    date_time:     Date.today + rand(1..30),
    owner_id:       User.all.sample.id,
    level:          LEVEL.sample
  },
  {
    name:         'Floral Design Sampler',
    description:  'Join us for a great day of flower design. The Sampler course is for individuals who want to try out our school and go home with a wealth of knowledge about the world of flower designing. It’s three great projects covering American to European design.',
    category:      CATEGORY[2],
    address:       Faker::Address.full_address,
    price:         rand(1..500),
    capacity:      rand(1..50),
    date_time:     Date.today + rand(1..30),
    owner_id:       User.all.sample.id,
    level:          LEVEL.sample
  }
]
  Workshop.create!(workshop_attributes)
  workshops_arr = Workshop.all


  4.times do
  picture = Photo.new
  picture.remote_image_url = PHOTOS_URLS[index_counter]
  picture.workshop = workshops_arr[index_counter]
  index_counter += 1
  picture.save
end


puts 'Workshop data added..'
puts 'creating bookings'

2.times do
  Booking.create!(
    workshop: Workshop.all.sample,
    user: User.all.sample,
    num_guests: rand(1..50)
    )
end

puts 'all done!'






