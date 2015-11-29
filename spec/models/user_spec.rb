require 'rails_helper'

RSpec.describe User, :type => :model do

  it 'can be saved' do
    email = Faker::Internet.email
    user_name = Faker::Internet.user_name

    user = User.create(email: email, password: Faker::Internet.password, username: user_name)
    user.save!

    found = User.last
    expect(found.email).to eq(email)
    expect(found.username).to eq(user_name)
  end

  it 'is impossible to add the same username twice' do
    user_name = Faker::Internet.user_name

    user = User.create(email: Faker::Internet.email, password: Faker::Internet.password, username: user_name)
    expect(user.valid?).to eq(true)

    other_user = User.create(email: Faker::Internet.email, password: Faker::Internet.password, username: user_name)
    expect(other_user.valid?).to eq(false)
  end

  it 'can edit' do
    user = User.create(email: Faker::Internet.email, password: Faker::Internet.password, username: Faker::Internet.user_name)
    user.save!

    user.password = Faker::Internet.password
    expect(user.save).to eq(true)
  end

  it 'can be destroy' do
    user = User.create(email: Faker::Internet.email, password: Faker::Internet.password, username: Faker::Internet.user_name)
    user.save!

    expect(user.destroy).to_not eq(false)
  end

end