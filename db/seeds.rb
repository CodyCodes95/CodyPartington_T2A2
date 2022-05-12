User.destroy_all

user = User.create(email:'admin@a.com', password:'admin00')
Address.create(street_number:1, street_name:'Wood Street', city:'Brisbane', state:'QLD', postcode:4000, country:'Australia')
user.create_profile(first_name:'Barry', last_name:'Burton', date_of_birth:'1995-10-02', address_id:1)
car = Car.create(make:'Toyota', model:'86')
listing = car.listings.create(profile_id:1, car_id:1, price:4000000, description:'My Toyota 86. All modifications listed in the modification section.', color:'red', year:2015)
listing.modifications.create(modification_type:'suspension', name:'Airlift Suspension')


puts "Users: #{User.count}"
puts "Profiles: #{Profile.count}"
puts "Addresses: #{Address.count}"
puts "Car: #{Car.count}"
puts "Listing: #{Listing.count}"
puts "Modification: #{Modification.count}"

