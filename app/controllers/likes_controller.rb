class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, post_id: @post.id)
    @posts = Post.all
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    @like.destroy
    @posts = Post.all
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
end
