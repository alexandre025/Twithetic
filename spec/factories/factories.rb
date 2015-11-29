FactoryGirl.define do

  factory :user do
    username { Faker::Lorem.word }
    email { Faker::Internet.email }
    password Faker::Internet.password(10)
  end

end