require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  describe 'GET index' do
    it 'displays a list of tweet' do
      posts = create_list(:post, 5)
      get :index

      expect(response).to have_http_status(:success)
    end
  end

end