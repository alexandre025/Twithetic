require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  login_user

  describe 'GET index' do
    it 'displays a list of tweet' do
      posts = create_list(:post, 5)
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create' do
    it 'create a new tweet' do
      get :index
      sentence = Faker::Lorem.sentence
      post :create, post: { user_id: @current_user.id, message: sentence}

      expect(response).to have_http_status(:found)
    end
  end

end