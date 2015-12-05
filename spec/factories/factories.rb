FactoryGirl.define do

  factory :user do
    firstname { Faker::Internet.firstname }
    lastname { Faker::Internet.lastname }
    username { Faker::Internet.user_name }
    email { "#{Faker::Internet.user_name}@example.com" }
    password Faker::Internet.password(10)
  end

  factory :post do
    message { Faker::Lorem.sentence }
    user
    factory :post_with_hashtags do
      message 'tweet with some hashtags #love #ruby'
    end
  end

end