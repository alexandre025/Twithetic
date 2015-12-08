class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :update, :create, :delete, :like, :retweet]

  before_action :load_collection, only: [:index]
  before_action :load_resource, only: [:update, :delete, :show]
  before_action :add_page_to_params, only: [:index, :user]

  def index
    @collection = Kaminari.paginate_array(@collection).page(params[:page]).per(10)
  end

  def create
    @object = Post.new(permitted_attributes)
    if @object.save
      redirect_to after_create_or_destroy_path, notice: 'new_post_success'
    else
      redirect_to after_create_or_destroy_path, notice: 'new_post_error'
    end
  end

  def destroy
    if current_user can? :delete
      @object
      @object.destroy
      redirect_to after_create_or_destroy_path, notice: 'delete_post_success'
    else
      redirect_to after_create_or_destroy_path, notice: 'delete_post_unauthorized'
    end
  end

  def show

  end

  def retweet
    post = Post.find(params[:post_id])
    retweeted = post.retweet(current_user)
    retweeted.save!
    render json: {}, status: 200
  end


  def like
    post = Post.find(params[:post_id])
    if current_user.following?(post)
      current_user.stop_following(post)
    else
      current_user.follow(post)
    end
    render json: {}, status: 200
  end

  private

  def load_resource
    @object = Post.find(params[:id])
  end

  def load_collection
    user_ids = current_user.following_users.pluck(:id) << current_user.id
    @collection = Post.where(user: user_ids)
  end

  def permitted_attributes
    params.require(:post).permit(:user_id, :message, image_attributes: [:attachment])
  end

  def after_create_or_destroy_path
    request.referrer || user_path(current_user)
  end

end