class UsersController < ApplicationController

  before_action :load_resources, only: [:show]
  before_action :add_page_to_params, only: [:show]

  def show
    def user
      @collection = Kaminari.paginate_array(@collection).page(params[:page]).per(10)
    end
  end

  private
    def load_resources
      @collection = Post.where(user: @object)
    end

    def load_resource
      @object = User.friendly.find(params[:id])
    end

end