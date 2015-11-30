class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :create, :delete, :like, :retweet]

  before_action :load_collection, only: [:index]
  before_action :load_resource, only: [:update, :delete, :show]
  before_action :add_page_to_params, only: [:index, :user]

  def index
    @collection = Kaminari.paginate_array(@collection).page(params[:page]).per(10)
  end

  def user
    @user = User.friendly.find(params[:id])
    @collection = Kaminari.paginate_array(Post.where(user: @user)).page(params[:page]).per(10)
  end

  def new
    @object = Post.new(user: current_user)
  end

  def create
    @object = Post.new(permitted_attributes)
    if @object.save
      flash.now[:notice] = 'new_post_success'
      render :index
    else
      flash.now[:error] = 'new_post_error'
      render :new
    end
  end

  def update
    if update_attribute(@object, permitted_attributes)
      flash.now[:notice] = 'update_post_success'
      redirect_to
    else

    end
  end

  def destroy
    @object.destroy
    flash.now[:notice] = 'delete_post_success'
    redirect_to user_path(current_user)
  end

  def show

  end

  def retweet
    post = Post.find(params[:post_id])
    begin
      retweeted = post.retweet(current_user)
      retweeted.save!
      render json: {}, status: 200
    rescue
      # TODO: Handling Exception if user try to retweet is own tweet
    end
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
  def add_page_to_params
    unless params.has_key? :page
      params.merge(page: 1)
    end
  end

  def load_resource
    @object = Post.find(params[:id])
  end

  def load_collection
    if params.has_key? :q
      @collection = Post.ransack(params[:q])
    else
      @collection = Post.all.order(created_at: :asc)
    end
  end

  def permitted_attributes
    params.require(:post).permit(:user_id, :message, image_attributes: [:attachment])
  end

end