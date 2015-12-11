FactoryGirl.define do

  factory :user do
    username { Faker::Internet.user_name }
    email { "#{Faker::Internet.user_name}@example.com" }
    password Faker::Internet.password(10)
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
  end

  factory :post do
    message { Faker::Lorem.sentence }
    user
    factory :post_with_hashtags do
      message 'tweet with some hashtags #love #ruby'
    end
    factory :post_with_random_hashtags do
      message { "#{Faker::Lorem.sentence(3)} ##{Faker::Lorem.word} ##{Faker::Lorem.word}" }
    end
  end

  factory :comment do
    message { Faker::Lorem.sentence }
    user
    post
  end

  factory :hashtag do
    name { Faker::Lorem.word }
  end

end