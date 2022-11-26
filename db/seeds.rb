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
puts "Created #{Category.count} categories"

puts "Creating tasks"
addresses_array = ["29 Main St Swindon SN2 2DQ",
                   "B4035, Chipping Campde",
                   "55 Woodfall Avenue, Barnet, Barnet, EN5 2HB, United Kingdom",
                   "35 Abbots Way, Bristol, BS9 4SN, United Kingdom",
                   "Fisherman's Path, Liverpool, L37 1YD, United Kingdom",
                   "69 Victoria Road, Formby, Liverpool, L37 1LN, United Kingdom",
                   "2 Bagbury Road, Bude, EX23 8QJ, United Kingdom",
                   "156 Elizabeth Road, Bude, EX23 8AS, United Kingdom",
                   "43 Victoria Road, Bude, EX23 8RJ, United Kingdom",
                   "2 Maer Lane, Bude, EX23 9EE, United Kingdom",
                   "4 Petherick Road, Bude, EX23 8SW, United Kingdom",
                   "11 Summerleaze Crescent, Bude, EX23 8HE, United Kingdom",
                   "39 Park Crescent, Emsworth, PO10 7NT, United Kingdom"
                  ]
30.times do |i|
  task = Task.new(title: Faker::Lorem.paragraph(sentence_count: 1),
                  date_time: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 20, format: :long),
                  category_id: rand(1..Category.count),
                  description: Faker::Lorem.paragraph(sentence_count: rand(1..10)),
                  user_id: rand(1..User.count),
                  need_help: [true, false].sample,
                  address: addresses_array.sample)
  task.save
  puts "Created task with id #{task.id}"
end

puts "Created #{Task.count} tasks"

puts "End seeds"
