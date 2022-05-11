User.destroy_all
Profile.destroy_all
Address.destroy_all

user = User.create(email:'admin@a.com', password:'admin00')
# Address.create(street_number:1, street_name:'Wood Street', city:'Brisbane', state:'QLD', postcode:4000, country:'Australia')
# user.create_profile(first_name:'Barry', last_name:'Burton', date_of_birth:'1995-10-02', address_id:1)

puts "Users: #{User.count}"
puts "Profiles: #{Profile.count}"
puts "Addresses: #{Address.count}"
