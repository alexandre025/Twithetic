class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:update,]

  before_action :load_collection, only: [:index]
  before_action :load_resource, only: [:update,:delete,:show]

  def index

  end

  def new
    @object = Post.new(user: current_user)
  end

  def create
    if @object.save
      flash.now[:notice] = 'new_post_success'
      render :index
    else
      flash.now[:error] = 'new_post_error'
      render :new
    end
  end

  def update

  end

  def delete
    @object.delete
  end

  def show

  end

  private
    def load_resource
      @object = Post.params[:id]
    end

    def load_collection
      if params.has_key? :q
        @collection = Post.ransack(params[:q])
      else
        @collection = Post.all
      end
    end

    def permitted_attributes
      params[:post].permit(:user_id,:message) # TO-DO : Complete permitted attributes
    end

end