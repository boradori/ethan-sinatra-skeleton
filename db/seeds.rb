require 'faker'

5.times do
  User.create(:username => Faker::Name.first_name, :email => Faker::Internet.email, :password => Faker::Lorem.word)
end

#test user
User.create(:username => "test_user", :email => "test@gmail.com", :password => "pass")
