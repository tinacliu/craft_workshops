require 'faker'

# Some data to choose from.
LEVEL = ["Beginner", "Intermediate", "Advanced"]
CATEGORY = ["Calligraphy", "Ceramics", "Floristry", "Glass", "Jewellery", 'Pottery', "Leather", "Paper", "Wood"]
TITLES = ['Spoon carving for beginners', 'Green wood chair making in Suffolk', 'Don White Woodturning Experience']
DURATION = [30, 60, 120, 180]
BIOS = ['I have been been doing wood by miself and want to learn more.', 'Single, 9 cats, Love to craft stuff', 'Have a lot of time and want to work on crafting things', 'I love to create Jewelry and my family uses all my creations', 'I love this site is the best thing that happened to me!']

# photo urls, from cloudinary

PHOTOS_URLS = ['https://res.cloudinary.com/dduochwyb/image/upload/v1559013354/craftsman_ave_55db18711ba0f_xpedxm.jpg', 'https://res.cloudinary.com/dduochwyb/image/upload/v1559013355/mokuchi_woodworking_studio_54ebc348b9865_uwngg9.png',
'https://res.cloudinary.com/dduochwyb/image/upload/v1559013354/alzerina_jewelry_5967105671bec_d5oezi.jpg', 'https://res.cloudinary.com/dduochwyb/image/upload/v1559013355/american_school_of_flower_design_57aea831259af_nbw8vv.png']
index_counter = 0

puts 'Remember to drop your table to use this seed.'

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
  bio: BIOS.sample
  )
end

puts 'User data added!'
puts 'Now adding Workshop data'

workshop_attributes = [
  {
    name:         'Introduction to Modern Woodworking',
    description:  'Students will make a small table suitable for use as a planter or side table. It will be constructed out of oak using half-lap joints to create a flush assembly. The style is contemporary and minimalist, so it should fit well with any existing interior design.',
    category:      CATEGORY[-1],
    address:       '1-chōme-3-24 Meguro, Meguro City, Tōkyō-to',
    price:         8500,
    capacity:      rand(1..50),
    date_time:     Date.today + rand(1..30),
    owner_id:      User.all.sample.id,
    level:         LEVEL.sample,
    duration:      DURATION.sample
  },
  {
    name:         'Japanese Woodworking Introduction',
    description:  'You will gain a broad understanding of how Japanese woodworking distinguishes itself from Western approaches during this two hour talk and demonstration. The session will include an overview of traditional hand tools used in a range of work scale, from making small objects to full size timber frame building.',
    category:      CATEGORY[-1],
    address:       '1-chōme-25-17 Nakachō, Meguro City, Tōkyō-to',
    price:         3000,
    capacity:      rand(1..50),
    date_time:      Date.today + rand(1..30),
    owner_id:       User.all.sample.id,
    level:          LEVEL.sample,
    duration:      DURATION.sample
  },
  {
    name:         'Jewelry Making',
    description:  'Are you looking to put your creativity in to action? Then the jewelry class is definitely for you. Either if you are looking to make professional jewelry or just for a hobby then you have find the right jewelry class.
      Come and enjoy this 90-minute fabulous, in-depth Jewelry making class where you will learn how to make unique and gorgeous jewelry for everyday wear and those special nights out.',
    category:      CATEGORY[4],
    address:       '2-chōme-9 Yaesu, Chuo City, Tōkyō-to',
    price:         5000,
    capacity:      rand(1..50),
    date_time:     Date.today + rand(1..30),
    owner_id:       User.all.sample.id,
    level:          LEVEL.sample,
    duration:      DURATION.sample
  },
  {
    name:         'Floral Design Sampler',
    description:  'Join us for a great day of flower design. The Sampler course is for individuals who want to try out our school and go home with a wealth of knowledge about the world of flower designing. It’s three great projects covering American to European design.',
    category:      CATEGORY[2],
    address:       '1-chōme-33 Higashi, Shibuya City, Tōkyō-to',
    price:         7300,
    capacity:      rand(1..50),
    date_time:     Date.today + rand(1..30),
    owner_id:       User.all.sample.id,
    level:          LEVEL.sample,
    duration:      DURATION.sample
  },
  {
    name:         'Make A Mug Workshop',
    description:  'The Make A Mug Workshop is a fun and easy introduction to working with clay. You will be shown how to construct a mug, with the choice of 4 different shapes. You will learn how to join pieces of clay together, including how to add a handle. You will be shown different decoration techniques so that you can decorate your mug. At the end of the workshop, you will get to choose which studio glaze you would like on your mug. It will then be fired and glazed for you, ready to collect at a later date. All materials are provided, as well as teas, coffees and biscuits. You won’t get that messy, but it is best to wear old clothes and shoes, just in case. This workshop is suitable for children over the age of 8. All children under the age of 16 must be accompanied by an adult.',
    category:      CATEGORY[5],
    address:       '1-chōme-7 Ariake, Koto City, Tōkyō-to',
    price:         3000,
    capacity:      rand(1..50),
    date_time:     DateTime.new(2019,9,7,10),
    owner_id:      User.all.sample.id,
    level:         LEVEL.sample,
    duration:      120
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

puts 'Creating Pitch workshop photos.......'

urls = ['https://static1.squarespace.com/static/57821680d1758e9af40b5460/t/5ac67cf36d2a73c1596bcec9/1522957579283/Turning+Earth+E10?format=1000w', 'https://static1.squarespace.com/static/57821680d1758e9af40b5460/5ac67d626d2a73c1596bebf5/5ac67e4e0e2e7211e5ca4f3c/1522958464330/_DSF2814.jpg?format=1500w', 'https://images.unsplash.com/photo-1556205801-a0bf81cdc90d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80', 'https://static1.squarespace.com/static/57821680d1758e9af40b5460/5ac67d626d2a73c1596bebf5/5ac684d1758d467fd1192596/1522959657588/20171225_TE_0384.jpg?format=1500w']
urls.each do |url|
  photo = Photo.new(workshop: workshops_arr.last)
  photo.remote_image_url = url
  photo.save
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
