class UsersController < ApplicationController
  before_action :authenticate_user!
  def user
  end

  def user_posts
    @user = User.find(params[:id])
  end

  def my_posts
    @posts = current_user.posts
    @myposts = params[:myposts]
    render 'user'
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    redirect_to users_my_posts_path unless @post.user.id == current_user.id
  end
end
