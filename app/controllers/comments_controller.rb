class CommentsController < ApplicationController

  before_action :authenticate_user!

  before_action :load_resource, only: [:delete]

  def create
    @object = Comment.new(permitted_attributes)
    @object.post_id = params[:post_id]
    if @object.save
      flash[:notice] = 'add_comment_success'
    else
      flash[:error] = 'add_comment_error'
    end
    redirect_to post_path(@object.post)
  end

  def destroy
    @object.destroy
    flash[:notice] = 'delete_comment_success'
    redirect_to post_path(@object.post)
  end

  private
    def load_resource
      @object = Comment.find(params[:id])
    end

    def permitted_attributes
      params.require(:comment).permit(:message,:user_id)
    end

end