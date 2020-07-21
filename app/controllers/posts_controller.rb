class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # Post.create(post_params)
  end

  private
  def post_params
    params.permit(:name, :text)
  end

end
