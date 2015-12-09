class SearchController < ApplicationController

  before_action :authenticate_user!

  before_action :load_resources, only: [:search_results]
  before_action :add_page_to_params, only: [:hashtag]

  def search_results
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10) if @posts
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(10) if @users
  end

  def hashtag
    @posts = Post.ransack(message_cont: params[:hashtag]).result
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
    @users = select_firsts_user(@posts, 2)
  end

  private
  def load_resources
    params.merge({q: ''}) unless params.has_key? :q
    if params.has_key? :f
      @users = User.ransack(username_or_firstname_or_lastname_cont: params[:q]).result
    else
      @posts = Post.ransack(message_cont: params[:q]).result
      @users = select_firsts_user(@posts, 2)
    end
  end
end