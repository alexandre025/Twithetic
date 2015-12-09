class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:follow, :followers, :following, :favorites]

  before_action :load_resource, only: [:show, :followers, :following, :favorites]
  before_action :load_resources, except: [:follow]
  before_action :add_page_to_params, except: [:follow]

  def show
    @collection = Kaminari.paginate_array(@collection).page(params[:page]).per(10)
  end

  def followers
    @collection = Kaminari.paginate_array(@object.user_followers).page(params[:page]).per(10)
  end

  def following
    @collection = Kaminari.paginate_array(@object.following_users).page(params[:page]).per(10)
  end

  def favorites
    @collection = Kaminari.paginate_array(@object.following_posts).page(params[:page]).per(10)
  end

  def follow
    user = User.friendly.find(params[:user_id])
    if current_user.following?(user)
      flash[:error] = t('notif.notice.success_unfollow', user: user.username)
      current_user.stop_following(user)
    else
      flash[:notice] = t('notif.notice.success_follow', user: user.username)
      current_user.follow(user)
    end
    redirect_to request.referer
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