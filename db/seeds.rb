require 'faker'

User.destroy_all
Attendance.destroy_all
Event.destroy_all

#création des user
user = []
event = []
attendance= []
20.times do  |i|

	user[i]= User.create(first_name: Faker::Name.first_name,last_name: Faker::Name.last_name, descritpion: Faker::Quote.matz, encrypted_password: Faker::Internet.password(min_length: 10, max_length: 20) ,email: "#{Faker::Name.middle_name}@yopmail.com")

	puts "user n°#{i}"
end

10.times do |i|

   event[i]= Event.create(start_date: Faker::Time.forward(days: 26,period: :day),duration: rand(10..240),title: Faker::Music::Opera.rossini,description: Faker::Quote.yoda ,price: rand(1000), location: Faker::Address.street_address)

	puts "event n°#{i}"
end

10.times do |i|

   attendance[i]= Attendance.create(stripe_customer_id: Faker::Blockchain::Bitcoin.address, event_id: event[rand(10)].id, user_id: user[rand(20)].id)
	puts "attendance n°#{i}"
end
