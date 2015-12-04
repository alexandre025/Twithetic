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
      devise_parameter_sanitizer.for(:sign_up) << [:username,:firstname,:lastname]
    end

    def add_page_to_params
      unless params.has_key? :page
        params.merge(page: 1)
      end
    end
end
