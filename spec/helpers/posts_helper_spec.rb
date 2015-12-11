require 'rails_helper'

RSpec.describe PostHelper, :type => :helper do

  it 'parsing hashtag and mention in tweet' do
    user = create(:user)
    hashtag = create(:hashtag)
    message = parse_tweet "parsing ##{hashtag.name} and @#{user.username}"

    expect(message).to eq("parsing #{ link_to("##{hashtag.name}", hashtag_path(hashtag: hashtag.name)) } and #{ link_to("@#{user.username}", user_path(user)) }")
  end

end