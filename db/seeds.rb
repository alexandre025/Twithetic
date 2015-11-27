# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


test_user = User.create(email: 'test@test.fr', username: 'test', password: 'azertyuiop', password_confirmation: 'azertyuiop')
10.times do |i|
  Post.create(user: test_user, message: 'azertyuiopqsdfghjklmwxcvbn')
end