class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:user_posts]
  def user
  end

  def user_posts
    @user = User.find(params[:id])
  end

  def my_posts
    @posts = current_user.posts.order(created_at: :DESC)
  end

  def favorite_posts
    @posts = current_user.favorite_posts
  end

  def aruaru_posts
    @posts = current_user.aruaru_posts
  end

  def nainai_posts
    @posts = current_user.nainai_posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @users = User.all
    @tag_hash = Tag.all
    redirect_to users_my_posts_path unless @post.user.id == current_user.id
  end
end
