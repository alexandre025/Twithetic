require 'rails_helper'

RSpec.describe Comment, :type => :model do

  it 'can be saved' do
    post = create(:post)
    user = create(:user)

    sentence = Faker::Lorem.sentence
    comment = post.comments.create(message: sentence, user_id: user.id)

    expect(comment.save!).to eq(true)
    expect(comment.message).to eq(sentence)
    expect(comment.user.id).to eq(user.id)
  end

  it 'needs to be linked to a post and a user' do
    user = create(:user)
    post = create(:post)
    comment = Comment.new(post: post, user: user, message: Faker::Lorem.sentence)

    expect(comment.user_id).to eq(user.id)
    expect(comment.post_id).to eq(post.id)
    expect(comment.valid?).to eq(true)
  end

  it 'can be edited' do
    comment = create(:comment)
    sentence = Faker::Lorem.sentence
    comment.update_attributes({message: sentence})

    expect(comment.message).to eq(sentence)
  end

end