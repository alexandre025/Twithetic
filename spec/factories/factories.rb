FactoryGirl.define do

  factory :user do
    username { Faker::Lorem.word }
    email { Faker::Internet.email }
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