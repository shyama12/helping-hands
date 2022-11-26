# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Start seeds"
Task.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating Users"

shyama = User.new(first_name: "Shyama",
                  last_name: "Menon",
                  address: "Bergen, Norway",
                  email: "shyama@helpinghands.com",
                  password: '123456')
shyama.save

ana = User.new(first_name: "Ana",
               last_name: "Mikic",
               address: "Munich, Germany",
               email: "ana@helpinghands.com",
               password: '123456')
ana.save

verity = User.new(first_name: "Verity",
                  last_name: "Shuker",
                  address: "Emsworth, UK",
                  email: "verity@helpinghands.com",
                  password: '123456')
verity.save

seb = User.new(first_name: "Seb",
               last_name: "Rojas",
               address: "Berlin, Germany",
               email: "seb@helpinghands.com",
               password: '123456')
seb.save
puts "Created #{User.count} users"

puts "Creating categories"
social_interactions = Category.new(name: "Social Interactions")
social_interactions.save

babysitting = Category.new(name: "Babysitting")
babysitting.save

running_errands = Category.new(name: "Running Errands")


puts "Created #{Category.count} categories"

puts "Creating tasks"
addresses_array = ["69 New Street SOUTH WEST LONDON SW21 9DP",
                   "920 North Street COLCHESTER CO68 0BX",
                   "83 Chester Road KIRKCALDY KY6 8TZ",
                   "53 Highfield Road NORWICH NR96 1NS",
                   "1 The Avenue SOUTHAMPTON SO20 4KX",
                   "295 Grange Road COVENTRY CV49 1SM",
                   "87 Main Street SOUTH EAST LONDON SE90 0YU",
                   "9919 School Lane WORCESTER WR5 6OF",
                   "30 Park Avenue ROCHESTER ME9 9WU",
                   "82 Park Road GLOUCESTER GL67 5YO",
                   "343 New Road BELFAST BT48 5RG",
                   "9795 George Street PRESTON PR63 3CQ",
                   "4 Grove Road CHELMSFORD CM65 2DK",
                   "10 The Grove DERBY DE80 8MB",
                   "405 King Street BOLTON BL3 2TJ",
                   "392 North Road KINGSTON UPON THAMES KT26 7RN",
                   "645 Broadway PAISLEY PA68 2IO",
                   "24 Richmond Road CARLISLE CA11 6JH",
                   "65 Green Lane HEREFORD HR62 1CL",
                   "58 The Drive BLACKPOOL FY19 0YE",
                   "74 Stanley Road SHREWSBURY SY87 9HW",
                   "621 The Green LLANDUDNO LL47 6NA",
                   "42 Windsor Road WEST LONDON W37 5EF",
                   "63 St. John's Road DUDLEY DY89 3NX",
                   "27 Victoria Road KIRKWALL KW72 0AJ",
                   "73 Station Road DARLINGTON DL88 4AD",
                   "25 Kingsway WESTERN CENTRAL LONDON WC17 9SU",
                   "192 Alexander Road SUNDERLAND SR23 6FQ",
                   "93 Manchester Road BRISTOL BS36 7QM",
                   "39 Manor Road DUMFRIES DG51 5UO"]
30.times do |i|
  task = Task.new(title: Faker::Lorem.paragraph(sentence_count: 1),
                  date_time: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 20, format: :long),
                  category_id: rand(1..Category.count),
                  description: Faker::Lorem.paragraph(sentence_count: rand(1..10)),
                  user_id: rand(1..User.count),
                  need_help: [true, false].sample,
                  address: addresses_array[i])
  task.save
  puts "Created task with id #{task.id}"
end

puts "Created #{Task.count} tasks"

puts "End seeds"
