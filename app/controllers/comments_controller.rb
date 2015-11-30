class CommentsController < ApplicationController

  def create
    @object = Comment.new(permitted_attributes)
    @object.post_id = params[:post_id]
    if @object.save
      flash.now[:notice] = 'add_comment_success'
    else
      flash.now[:error] = 'add_comment_error'
    end
    redirect_to post_path(@object.post)
  end

  def update

  end

  def delete

  end

  private
    def load_resource
      @object = Comment.find(params[:id])
    end

    def permitted_attributes
      params.require(:comment).permit(:message,:user_id)
    end

end