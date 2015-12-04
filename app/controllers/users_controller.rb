class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:follow]

  before_action :load_resource, only: [:show]
  before_action :load_resources, only: [:show]
  before_action :add_page_to_params, only: [:show]

  def show
    @collection = Kaminari.paginate_array(@collection).page(params[:page]).per(10)
  end

  def follow
    user = User.find(params[:user_id])
    if current_user.following?(user)
      current_user.stop_following(user)
    else
      current_user.follow(user)
    end
    redirect_to request.referer
  end

  private
  def load_resources
    @collection = Post.where(user: @object).order(created_at: :asc)
  end

  def load_resource
    @object = User.friendly.find(params[:id])
  end

end