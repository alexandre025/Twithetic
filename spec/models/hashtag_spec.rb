require 'rails_helper'

RSpec.describe Hashtag, :type => :model do

  it 'parse post and create hashtags' do
    post = create(:post_with_hashtags)
    hashtags = Hashtag.all

    expect(hashtags.size).to eq(2)
    expect(hashtags.pluck(:name)).to include('love', 'ruby')
    expect(hashtags.pluck(:mention)).to eq([1,1])
  end

end