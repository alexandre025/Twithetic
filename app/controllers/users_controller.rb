class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:follow, :edit, :update]

  before_action :load_resource, only: [:show, :edit]
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

  def edit
  end

  def update
    redirect_to user_path
  end

  private
    def load_resources
      @collection = Post.where(user: @object)
    end

    def load_resource
      @object = User.friendly.find(params[:id])
    end

    def permitted_attributes
      params.require(:user).permit(:firstname, :lastname, :bio, :image, :banner)
    end

end