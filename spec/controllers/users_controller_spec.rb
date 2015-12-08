require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  login_user
  render_views

  describe 'GET show' do
    it 'show user profile page' do
      user = create(:user)
      get :show, id: user.id.to_s, locale: :en

      expect(response).to have_http_status(:success)
      expect(response.body).to include('<span class="user-username">@' + user.username + '</span>')
    end
  end

  describe Devise::RegistrationsController, :type => :controller do
    it 'show edit user profile' do
      get :edit, locale: :en

      expect(response).to have_http_status(:success)
    end
  end

  describe Devise::SessionsController, :type => :controller do
    it 'show login page for unlogin user' do
      sign_out @current_user
      get :new, locale: :en

      expect(response).to have_http_status(:success)
    end

    it 'redirect login user when visiting login page' do
      get :new, locale: :en

      expect(response).to have_http_status(:found)
    end
  end

end