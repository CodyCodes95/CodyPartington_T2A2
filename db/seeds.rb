User.destroy_all

user = User.create(email:'admin@a.com', password:'admin00')

puts "Users: #{User.count}"