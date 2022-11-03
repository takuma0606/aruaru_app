class CommentsController < ApplicationController
  def create 
    Comment.create(comment_params)
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:text,:post_id).merge(user_id: current_user.id)
  end
end
