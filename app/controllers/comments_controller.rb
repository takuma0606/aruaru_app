class CommentsController < ApplicationController
  def create 
    Comment.create(comment_params)
    redirect_to request.referer
  end

  def update 
    comment = Comment.find(params[:comment][:comment_id])
    comment.update(comment_update_params)
    redirect_to request.referer
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:text,:post_id).merge(user_id: current_user.id)
  end

  def comment_update_params 
    params.require(:comment).permit(:text)
  end
end
