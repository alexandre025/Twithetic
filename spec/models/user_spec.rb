require 'rails_helper'

RSpec.describe User, :type => :model do

  it 'can be saved' do
    email = Faker::Internet.email
    user_name = Faker::Internet.user_name

    user = User.create(email: email, password: Faker::Internet.password,
                       username: user_name, firstname: Faker::Name.first_name,
                       lastname: Faker::Name.last_name)
    user.save!

    found = User.last
    expect(found.email).to eq(email)
    expect(found.username).to eq(user_name)
  end

  it 'is impossible to add the same username twice' do
    user_name = Faker::Internet.user_name

    user = User.create(email: Faker::Internet.email, password: Faker::Internet.password, username: user_name,
                       firstname: Faker::Name.first_name, lastname: Faker::Name.last_name)
    expect(user.valid?).to eq(true)

    other_user = User.create(email: Faker::Internet.email, password: Faker::Internet.password, username: user_name,
                             firstname: Faker::Name.first_name, lastname: Faker::Name.last_name)
    expect(other_user.valid?).to eq(false)
  end

  it 'can edit' do
    user = create(:user)
    user.password = Faker::Internet.password

    expect(user.save).to eq(true)
  end

  it 'can be destroy' do
    user = create(:user)

    expect(user.destroy).to_not eq(false)
  end

  it 'can like and unlike a tweet' do
    user = create(:user)
    post = create(:post)
    user.follow(post)

    expect(user.following?(post)).to eq(true)
    user.stop_following(post)
    expect(user.following?(post)).to eq(false)
  end

end