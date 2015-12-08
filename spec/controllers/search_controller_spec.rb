require 'rails_helper'

RSpec.describe SearchController, :type => :controller do

  login_user
  render_views

  it 'search content without typing anything' do
    posts = create_list(:post, 5)
    post :search_results, locale: :en

    expect(response).to have_http_status(:success)
    posts.each do |post|
      expect(response.body).to include("post_#{post.id}")
    end
  end

  it 'search a specific content' do
    posts = create_list(:post, 5)
    post :search_results, q: posts.first.message, locale: :en

    expect(response).to have_http_status(:success)
    expect(response.body).to include("post_#{posts.first.id}")
  end

end