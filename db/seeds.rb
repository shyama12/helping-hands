# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Start seeds"
Experience.destroy_all
Message.destroy_all
ChatroomUser.destroy_all
Chatroom.destroy_all
TaskApplication.destroy_all
Task.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating Users"

shyama = User.new(first_name: "Shyama",
                  last_name: "Menon",
                  address: "Bergen, Norway",
                  email: "shyama@helpinghands.com",
                  password: '123456')
shyama.photo.attach(io: File.open("./app/assets/images/shyama.jfif"), filename: "shyama_image.png", content_type: "image/png")
shyama.save

ana = User.new(first_name: "Ana",
               last_name: "Mikic",
               address: "Munich, Germany",
               email: "ana@helpinghands.com",
               password: '123456')
ana.photo.attach(io: File.open("./app/assets/images/ana.png"), filename: "ana_image.png", content_type: "image/png")
ana.save

verity = User.new(first_name: "Verity",
                  last_name: "Shuker",
                  address: "Emsworth, UK",
                  email: "verity@helpinghands.com",
                  password: '123456')
verity.photo.attach(io: File.open("./app/assets/images/verity.jfif"), filename: "verity_image.png", content_type: "image/png")
verity.save

seb = User.new(first_name: "Seb",
               last_name: "Rojas",
               address: "Berlin, Germany",
               email: "seb@helpinghands.com",
               password: '123456')
seb.photo.attach(io: File.open("./app/assets/images/seb.jfif"), filename: "seb_image.png", content_type: "image/png")
seb.save
puts "Created #{User.count} users"

puts "Creating categories"
social_interactions = Category.new(name: "Social Interactions")
social_interactions.save

home = Category.new(name: "Home")
home.save

diy = Category.new(name: "DIY")
diy.save

running_errands = Category.new(name: "Running Errands")
running_errands.save

other = Category.new(name: "Other")
other.save
puts "Created #{Category.count} categories"

puts "Creating tasks"
addresses_city_array = [
  ["55 Woodfall Avenue, Barnet, Barnet, EN5 2HB, United Kingdom", "Barnet"],
  ["35 Abbots Way, Bristol, BS9 4SN, United Kingdom", "Bristol"],
  ["Fisherman's Path, Liverpool, L37 1YD, United Kingdom", "Liverpool"],
  ["69 Victoria Road, Formby, Liverpool, L37 1LN, United Kingdom", "Liverpool"],
  ["2 Bagbury Road, Bude, EX23 8QJ, United Kingdom", "Bude"],
  ["156 Elizabeth Road, Bude, EX23 8AS, United Kingdom", "Bude"],
  ["43 Victoria Road, Bude, EX23 8RJ, United Kingdom", "Bude"],
  ["2 Maer Lane, Bude, EX23 9EE, United Kingdom", "Bude"],
  ["4 Petherick Road, Bude, EX23 8SW, United Kingdom", "Bude"],
  ["11 Summerleaze Crescent, Bude, EX23 8HE, United Kingdom", "Bude"],
  ["39 Park Crescent, Emsworth, PO10 7NT, United Kingdom", "Emsworth"],
  ["6 Nore Crescent, Emsworth, PO10 7NA, United Kingdom", "Emsworth"],
  ["7 Henley Road, London, N18 1NS, United Kingdom", "London"],
  ["Harbolets Road, Pulborough, RH20 2LE, United Kingdom", "Pulborough"],
  ["A352, Dorchester, DT2 7SH, United Kingdom", "Dorchester"],
  ["B3289, Truro, TR2 5JQ, United Kingdom", "Truro"],
  ["PL30 5BZ, Bodmin, Cornwall, England, United Kingdom", "Cornwall"],
  ["SY8 2AL, Ludlow, Shropshire, England, United Kingdom", "Shropshire"],
  ["1 Union Street, Beeston, Nottingham, NG9 2LU, United Kingdom", "Nottingham"],
  ["2 Cornwall Avenue, Beeston, Nottingham, NG9 1NL, United Kingdom", "Nottingham"],
  ["South Croxton Road, Leicester, LE7 3RX, United Kingdom", "Leicester"],
  ["KA18 2RU, Cumnock, East Ayrshire, Scotland, United Kingdom", "East Ayrshire"],
  ["TD2 6SJ, Lauder, Scottish Borders, Scotland, United Kingdom", "Scottish Borders"],
  ["YO7 2JX, Thirsk, North Yorkshire, England, United Kingdom", "North Yorkshire"],
  ["Gatenby Lane, Northallerton, DL7 9PG, United Kingdom", "Northallerton"],
  ["118 Devonshire Street, Westminster, London, W1G 6PD, United Kingdom", "London"],
  ["165 Oxford Street, Westminster, London, W1D 2JL, United Kingdom", "London"],
  ["Osnaburgh Terrace, Camden, London, NW1 3DE, United Kingdom", "London"],
  ["56 Perrers Road, Hammersmith and Fulham, London, W6 0EZ, United Kingdom", "London"],
  ["Pynham Crescent, Chichester, PO18 8FQ, United Kingdom", "Chichester"]
]

titles_nh_category_array = [
  ["Looking to make a friend in my new neighborhood", true, Category.first.id],
  ["Need someone that can teach me basics in cooking", true, Category.first.id + 1],
  ["Need help building a bird house", true, Category.first.id + 2],
  ["Looking for help picking up my medicines", true, Category.first.id + 3],
  ["Looking for a volunteer to test our app", true, Category.first.id + 4],
  ["If someone's new to the city, I can be your friend!", false, Category.first.id],
  ["I can teach you cooking basics", false, Category.first.id + 1],
  ["I'm free to help with DIY projects", false, Category.first.id + 2],
  ["I just got a new car and can pick things up for those who need it", false, Category.first.id + 3],
  ["I can help if someone needs lessons in Java!", false, Category.first.id + 4],
  ["Need someone to pet-sit my cat", true, Category.first.id],
  ["Does anyone know how to recarpet floors?", true, Category.first.id + 1],
  ["Need a little advice on tools for a DIY outhouse", true, Category.first.id + 2],
  ["Looking for someone to carpool with to office", true, Category.first.id + 3],
  ["Does anyone have tips on the best eateries around?", true, Category.first.id + 4],
  ["I can be your tour guide for a day and show you around the city", false, Category.first.id],
  ["Does anyone need a babysitter?", false, Category.first.id + 1],
  ["I'm a mechanic looking to help people working on their own projects", false, Category.first.id + 2],
  ["Does anyone want to carpool to work in the mornings?", false, Category.first.id + 3],
  ["Free zumba lessons!", false, Category.first.id + 4],
  ["Looking to make a friend in my new neighborhood", true, Category.first.id],
  ["Need someone that can teach me basics in cooking", true, Category.first.id + 1],
  ["Need help building a bird house", true, Category.first.id + 2],
  ["Looking for help picking up my medicines", true, Category.first.id + 3],
  ["Looking for a volunteer to test our app", true, Category.first.id + 4],
  ["If someone's new to the city, I can be your friend!", false, Category.first.id],
  ["I can teach you cooking basics", false, Category.first.id + 1],
  ["I'm free to help with DIY projects", false, Category.first.id + 2],
  ["I just got a new car and can pick things up for those who need it", false, Category.first.id + 3],
  ["I can help if someone needs lessons in Java!", false, Category.first.id + 4]
]
30.times do |i|
  task = Task.new(title: titles_nh_category_array[i][0],
                  date_time: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 20, format: :long),
                  category_id: Category.all.sample.id,
                  description: Faker::Lorem.paragraph(sentence_count: rand(1..10)),
                  user_id: User.all.sample.id,
                  need_help: titles_nh_category_array[i][1],
                  address: addresses_city_array[i][0],
                  city: addresses_city_array[i][1])
  task.save!
  puts tasks.errors.messages if task.errors.present?
  puts "Created task with id #{task.id}"
end

puts "Created #{Task.count} tasks"

puts "End seeds"
