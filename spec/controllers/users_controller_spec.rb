require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  login_user
  render_views

  describe 'GET show' do
    it 'show user profile page' do
      user = create(:user)
      get :show, id: user.id.to_s

      expect(response).to have_http_status(:success)
      expect(response.body).to include('<span class="user-username">@' + user.username + '</span>')
    end
  end

  describe Devise::RegistrationsController, :type => :controller do
    it 'show edit user profile' do
      get :edit

      expect(response).to have_http_status(:success)
    end
  end

end