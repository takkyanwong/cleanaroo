# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning Database"

BookingTask.destroy_all
Booking.destroy_all
Property.destroy_all
Review.destroy_all
Task.destroy_all
User.destroy_all

puts "Seeding Stuff"

#Arrays with variables
names = ['Tay', 'Jamile', 'Clement', 'Martyna', 'Fabienne', 'Marin', 'Ben', 'Gus', 'Paul']
cleaners_names = ['Lola', 'Pepa', 'Bernarda', 'Sandra', 'Vanesa', 'Yessica']
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

#Roles: 0 = Property Manager 1 = Cleaner //defined in User Model
users = []
names.each do |name|
  users << User.create!(email: "#{name}@gmail.com", password: 'password', name: name, phone_number: '+34123465233', role: 0)
end

cleaners = []
  cleaners_names.each do |cn|
    cleaners << User.create!(email: "#{cn}@gmail.com", password: 'password', name: cn, phone_number: '+34123465233', role: 1)
  end



10.times {
properties = Property.create!(
  address: addresses.sample,
  size: rand(1..5),
  bedroom_count: rand(1..5),
  bathroom_count: rand(1..5),
  note: "Beware of the doggo",
  user: users.sample,
  property_type: types.sample
  )
}

puts "Finished seeding!"
