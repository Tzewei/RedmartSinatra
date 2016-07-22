require './models/user'

(0..10).each do |i|
  User.create(title: "User #{i}")
end
