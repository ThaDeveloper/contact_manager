# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Contact.destroy_all
contacts = []

#generate 20 fake data
20.times do |i|
    new_contact = {
        id: i,
        name: Faker::Name.name,
        email: Faker::Internet.email,
        company: Faker::Company.name,
        address: "#{Faker::Address.street_name} #{Faker::Address.zip} #{Faker::Address.city}",
        phone: Faker::PhoneNumber.cell_phone
    }
    contacts.push(new_contact)
end

#save the fake data to db
Contact.create(contacts)