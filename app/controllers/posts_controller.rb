class PostsController < ApplicationController
  def index
    @posts = Post.all
    @images = Image.all
  end

  def new
    @post = Post.new
    @post.images.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:name, :text,images_attributes: [:src]).merge(user_id: current_user.id)
  end
end
