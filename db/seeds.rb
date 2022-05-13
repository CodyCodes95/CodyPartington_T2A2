Listing.destroy_all
User.destroy_all

user = User.create!(email:'admin@a.com', password:'admin00')
Address.create!(street_number:1, street_name:'Wood Street', city:'Brisbane', state:'QLD', postcode:4000, country:'Australia')
user.create_profile!(first_name:'Barry', last_name:'Burton', date_of_birth:'1995-10-02', address_id:1)

# 86

car = Car.create!(make:'Toyota', model:'86')
listing = car.listings.create!(profile_id:1, car_id:1, price:4000000, description:'My Toyota 86. All modifications listed in the modification section.', color:'red', year:2015)
listing.modifications.create!(modification_type:'suspension', name:'Airlift Suspension')
listing.modifications.create!(modification_type:'engine', name:'NA')
listing.modifications.create!(modification_type:'suspension', name:'Racer X Upper control arms')
listing.modifications.create!(modification_type:'interior', name:'NA')
listing.modifications.create!(modification_type:'exterior', name:'Moulded Rocket Bunny V1 rear overfenders')
listing.modifications.create!(modification_type:'exterior', name:'Todoroki front fenders')
listing.modifications.create!(modification_type:'exterior', name:'Moulded Legsport rear spoiler')
listing.modifications.create!(modification_type:'wheels', name:'Rotiform YVR 9.5+0')
listing.car_images.attach(io: File.open("#{Rails.root}/public/h.jpg"), filename: 'h.jpg')
listing.car_images.attach(io: File.open("#{Rails.root}/public/h2.jpg"), filename: 'h2.jpg')
listing.car_images.attach(io: File.open("#{Rails.root}/public/h3.jpg"), filename: 'h3.jpg')

#A4

car = Car.create!(make:'Audi', model:'A4')
listing = car.listings.create!(profile_id:1, car_id:2, price:2500000, description:'My Audi A4. All modifications listed in the modification section.', color:'White', year:2010)
listing.modifications.create!(modification_type:'suspension', name:'Airlift Suspension')
listing.modifications.create!(modification_type:'engine', name:'NA')
listing.modifications.create!(modification_type:'suspension', name:'T-Demand rear upper control arms')
listing.modifications.create!(modification_type:'suspension', name:'Front upper control arms')
listing.modifications.create!(modification_type:'interior', name:'NA')
listing.modifications.create!(modification_type:'exterior', name:'Moulded rear spoiler')
listing.modifications.create!(modification_type:'exterior', name:'RS4 front bar')
listing.modifications.create!(modification_type:'exterior', name:'Smoked tail lights')
listing.modifications.create!(modification_type:'wheels', name:'Work Equip 05 18x10 & 18x10.5')
listing.car_images.attach(io: File.open("#{Rails.root}/public/a1.jpg"), filename: 'a1.jpg')
listing.car_images.attach(io: File.open("#{Rails.root}/public/a2.jpg"), filename: 'a2.jpg')
listing.car_images.attach(io: File.open("#{Rails.root}/public/a3.jpg"), filename: 'a3.jpg')

puts "Users: #{User.count}"
puts "Profiles: #{Profile.count}"
puts "Addresses: #{Address.count}"
puts "Car: #{Car.count}"
puts "Listing: #{Listing.count}"
puts "Modification: #{Modification.count}"