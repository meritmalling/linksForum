class PostsController < ApplicationController

  before_action :is_authenticated

  def index
    @posts = Post.all

  end

  def new
    @post = Post.new
    render layout: false
  end

  def create
    @current_user.posts.create post_params
    redirect_to posts_path
  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
  redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
    render layout: false
  end

  def update
    @post = Post.find(params[:id])
    @post.update post_params
    if @post
      @post.save
      flash[:sucess] = "Post Updated"
      redirect_to posts_path
    else
      flash[:danger] = "Sorry, please provide a valid title and link."
      redirect_to posts_path
  end
end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end
end


