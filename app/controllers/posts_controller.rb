class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy aruaru nainai ]
  before_action :authenticate_user!, only: %i[ new edit ]
  before_action :check_user, only: %i[  edit destroy ]

  def user_posts
  end

  # GET /posts or /posts.json
  def index
    @q = Tag.ransack(params[:q])
    @tag = @q.result.first
    if @tag
      @posts = @tag.posts
    else 
      @posts = Post.all
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @form = PostsForm.new
  end

  # GET /posts/1/edit
  def edit
    @tag_list = @post.tags.pluck(:name).join(",")
    @form = PostsForm.new(post: @post)
  end

  # POST /posts or /posts.json
  def create
    @form = PostsForm.new(post_params)
    tag_list = params[:posts_form][:name].split(",")
    if @form.valid?
      @form.save(tag_list)
      redirect_to users_my_posts_path
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @form = PostsForm.new(post_update_params, post: @post)
    tag_list = params[:posts_form][:name].split(",")
    if @form.update(tag_list)
      redirect_to users_my_posts_path
    else
      render :edit
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    redirect_to users_my_posts_path
  end

  def aruaru
    Aruaru.create(post_id: params[:id], user_id: current_user.id)
  end

  def nainai
    Nainai.create(post_id: params[:id], user_id: current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def check_user
      redirect_to users_my_posts_path unless @post.user.id == current_user.id
    end

    def post_update_params
      params.require(:posts_form).permit(:content, :name).merge(user_id: current_user.id, post_id: params[:id])    
    end
  

    def post_params
      params.require(:posts_form).permit(:content, :name).merge(user_id: current_user.id)
    end
end
