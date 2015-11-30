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

  it 'needs to be linked to a user' do
    user = create(:user)
    post = Post.new(user: user, message: Faker::Lorem.sentence)

    expect(post.user).to eq(user)
    expect(post.user_id).to eq(user.id)
    expect(post.valid?).to eq(true)
  end

  it 'can be edited' do
    post = create(:post)
    sentence = Faker::Lorem.sentence
    post.update_attributes({message: sentence})

    expect(post.message).to eq(sentence)
  end

end