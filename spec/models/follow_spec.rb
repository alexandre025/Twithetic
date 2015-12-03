require 'rails_helper'

RSpec.describe Follow, :type => :model do

  it 'user can follow and be followed be user' do
    user = create(:user)
    other_user = create(:user)
    user.follow(other_user)

    expect(user.following?(other_user)).to eq(true)
    expect(other_user.followed_by?(user)).to eq(true)
  end

end