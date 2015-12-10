class CommentsController < ApplicationController

  before_action :authenticate_user!

  before_action :load_resource, only: [:destroy]

  def create
    @object = Comment.new(permitted_attributes)
    @object.post_id = params[:post_id]
    if @object.save
      flash[:notice] = t('notif.notice.add_comment_success')
    else
      flash[:error] = t('notif.error.add_comment_error')
    end
    redirect_to post_path(@object.post)
  end

  def destroy
    post = @object.post
    if can? :destroy, @object
      @object.destroy!
      redirect_to post_path(post), notice: t('notif.notice.delete_comment_success')
    else
      redirect_to post_path(post), error: t('notif.error.delete_comment_unauthorized')
    end
  end

  private
    def load_resource
      @object = Comment.find(params[:id])
    end

    def permitted_attributes
      params.require(:comment).permit(:message,:user_id)
    end

end