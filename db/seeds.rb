# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Group.destroy_all
Contact.destroy_all

#Generate groups dummy data
groups = []
#Create new group and get id and store it to group arrays
groups << Group.create(name: "Family").id#0
groups << Group.create(name: "Friend").id#1
groups << Group.create(name: "Colleagues").id#2

contacts = []

#generate 20 fake data
40.times do |i|
    new_contact = {
        id: i,
        name: Faker::Name.name,
        email: Faker::Internet.email,
        company: Faker::Company.name,
        address: "#{Faker::Address.street_name} #{Faker::Address.zip} #{Faker::Address.city}",
        phone: Faker::PhoneNumber.cell_phone,
        group_id: groups[Random.rand(0..2)]
    }
    contacts.push(new_contact)
end

#save the fake data to db
Contact.create(contacts)

p "#{Group.count} groups successfully created"
p "#{Contact.count} contacts successfully created"