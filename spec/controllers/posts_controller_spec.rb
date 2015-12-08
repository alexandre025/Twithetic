require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  login_user
  render_views

  describe 'GET index' do
    it 'displays a list of tweet' do
      user = create(:user)
      5.times do
        user.posts.create(attributes_for(:post))
      end
      @current_user.follow(user)

      get :index

      expect(response).to have_http_status(:success)
      user.posts.each do |post|
        expect(response.body).to include("post_#{post.id}")
      end
    end
  end

  describe 'POST create' do
    it 'create a new tweet' do
      get :index
      sentence = Faker::Lorem.sentence
      post :create, post: {user_id: @current_user.id, message: sentence}

      expect(response).to have_http_status(:found)
    end
  end

end