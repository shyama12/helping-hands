# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Start seeds"
User.destroy_all
Task.destroy_all
Category.destroy_all

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

10.times do
  task = Task.new(title: Faker::Lorem.paragraph(sentence_count: 1),
                  date_time: Faker::Time.between(from: DateTime.now + 10, to: DateTime.now, format: :long),
                  category_id: rand(1..Category.count),
                  description: Faker::Lorem.paragraph(sentence_count: rand(1..10)),
                  user_id: rand(1..User.count),
                  need_help: [true, false].sample,
                  address: ["Paris, France", "London, UK", "Tokyo, Japan"].sample)

  task.save
  puts "Created task with id #{task.id}"
end

puts "Created #{Task.count} tasks"

puts "End seeds"
