# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning Database"

Review.destroy_all
Booking.destroy_all
Property.destroy_all
Task.destroy_all
User.destroy_all

puts "Seeding Stuff"

#Arrays with variables
names = ['Tay', 'Jamile', 'Clement', 'Martyna', 'Fabienne', 'Marin', 'Ben', 'Gus', 'Paul']
cleaners_names = ['Lola', 'Pepa', 'Bernarda', 'Sandra', 'Vanessa', 'Yessica']
types = ['House', 'Apartment']
addresses = [ "Avenida Del Portal De L'Angel, 32-34
08002 Barcelona, España.",

"Carrer Pelai, 58
08001 Barcelona, España.",

"Passeig de Gràcia, 16
08008 Barcelona, España.",

"Avenida Diagonal, 584
08021 Barcelona, España.",

"Glories, 208
08018 Barcelona, España.",

"Avenida Diagonal, 557
08029 Barcelona, España",

"Carrer Potosi, 2
08030 Barcelona, España.",

"Carretera de Sants, 27
08014 Barcelona, España.",

"Carrer Gran de Gràcia, 74
08012 Barcelona, España.",

"Aeropuerto de Barcelona El Prat T-1
El Prat de Llobregat
08820 Barcelona, España." ]

tasks = ['Regular cleaning', 'Carpet cleaning', 'Windows cleaning', 'Feed the bird', 'Water the plants', 'Cleaning supplies needed']

titles = ['Best service ever!', 'Can recommend Cleanaroo to everyone!', 'Get the best cleaners in Barcelona']

descriptions = ['Excellent service. On time cleaning! Professional service provided', 'Took a while for a cleaner in our area to pop up, but once we had one booked in...', 'I have been having trouble finding competent cleaners, but with Cleanaroo it is easy peasy.']

# Roles: 0 = Property Manager 1 = Cleaner //defined in User Model
users = []
names.each do |name|
  users << User.create!(email: "#{name}@gmail.com", password: 'password', name: name, phone_number: '+34123465233', role: 0)
end

cleaners = []
  cleaners_names.each do |cn|
    cleaners << User.create!(email: "#{cn}@gmail.com", password: 'password', name: cn, phone_number: '+34123465233', role: 1)
  end

  # Seeding properties
  50.times {
    property = Property.create!(
  address: addresses.sample,
  size: rand(1..5),
  bedroom_count: rand(1..5),
  bathroom_count: rand(1..5),
  note: "Beware of the doggo",
  user: users.sample,
  property_type: types.sample
)
  puts "#{property.address} #{property.user.name}"
}

# Seeding bookings
50.times {
  booking = Booking.create!(
    cost: rand(99..299),
    property: Property.all.sample,
    user: cleaners.sample,
    date: rand(3.month.ago..2.weeks.from_now).to_datetime,
    comment: "be good with my place",
    state: "paid"
  )
  puts "#{booking.date} #{booking.user.name}"
}

# Seeding review
10.times {
  review = Review.create!(
    rating: rand(4..5),
    description: descriptions.sample,
    title: titles.sample,
    booking: Booking.all.sample
  )
  puts "#{review.description} #{review.rating}"
}

# Seeding tasks
tasks.each do |task|
  task = Task.create!(
    title: task,
    price: rand(5..39)
  )

  puts "#{task.title} #{task.price}"
end

# Seeding booking_tasks
Booking.all.each do |booking|
  tasks = Task.all.shuffle
  rand(1..5).times{
    booking_task = BookingTask.create!(
      booking: booking,
      task: tasks.pop # pop = take the last element of the array and delete it
    )
    puts "#{booking_task.booking.user.name}
    #{booking_task.task.title}
    #{booking_task.booking.property.address}
    #{booking_task.booking.date}"
  }
end

puts "Finished seeding!"
