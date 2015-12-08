class SearchController < ApplicationController

  before_action :authenticate_user!

  before_action :load_resources, only: [:search_results]
  before_action :add_page_to_params, only: [:hashtag]

  def search_results
  end

  def hashtag
    @posts = Post.ransack(message_cont: params[:hashtag]).result
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
  end

  private
    def load_resources
      if params.has_key? :q
        @posts = Post.ransack(message_cont: params[:q]).result
        @users = User.ransack(username_or_firstname_or_lastname_cont: params[:q]).result
      else
        @users = User.all
        @posts = Post.all
      end
    end

end