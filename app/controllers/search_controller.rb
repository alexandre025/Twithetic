class SearchController < ApplicationController

  before_action :load_resources, only: [:search_results]

  def search_results
    console
  end

  def hashtag
    @posts = Post.ransack(message_cont: params[:hashtag]).result
  end

  private
    def load_resources
      if params.has_key? :q
        @posts = Post.ransack(message_cont: params[:q]).result
        @users = User.ransack(user_name_cont: params[:q]).result
      else
        @users = User.all
        @posts = Post.all
      end
    end

end