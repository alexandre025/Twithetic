require 'rails_helper'

RSpec.describe Post, :type => :model do

  it 'can be saved' do
    user = create(:user)

    sentence = Faker::Lorem.sentence
    post = user.posts.create(message: sentence)

    expect(post.save!).to eq(true)
    expect(post.message).to eq(sentence)
    expect(post.user.id).to eq(user.id)
  end

end