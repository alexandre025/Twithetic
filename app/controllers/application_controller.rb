class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action do
    @trend_hashtags = Hashtag.order(mention: :asc).first(10)
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :firstname, :lastname]
    devise_parameter_sanitizer.for(:account_update) << [:firstname, :lastname, :bio, image_attributes: [:attachment, :id], banner_attributes: [:attachment, :id]]
  end

  def add_page_to_params
    unless params.has_key? :page
      params.merge(page: 1)
    end
  end

  def select_firsts_user(collection, number)
    if user_signed_in?
      user_ids = collection.pluck(:user_id)
      return User.where(id: user_ids).select { |u| !current_user.following?(u) and u != current_user }.first(number)
    end
  end
end
