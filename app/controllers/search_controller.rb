class SearchController < ApplicationController

  before_action :load_resources

  def search_results
    console
  end

  private
    def load_resources
      if params.has_key? :q
        @posts = Post.ransack(message_cont: params[:q])
        @users = User.ransack(user_name_cont: params[:q])
      else
        @users = User.all
        @posts = Post.all
      end
    end

end