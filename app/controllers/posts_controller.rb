class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    @posts = Post.all
    @posts = Post.includes(:images,:user).order('created_at DESC').page(params[:page]).per(6)
    @likes = Post.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
    @images = Image.all
  end

  def new
    @post = Post.new
    @post.images.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:alert] = "投稿が完了しました"
      redirect_to root_path
    else
      flash[:alert] = "投稿内容をご確認ください"
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end


  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to("/")
    flash[:alert] = "投稿が編集されました。"
  end

  def destroy
    @post.destroy
    redirect_to("/")
    flash[:alert] = "投稿が削除されました。"
  end

  def search
    @posts = Post.search(params[:keyword])
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end
  
  private
  def post_params
    params.require(:post).permit(:name, :text,images_attributes: [:src]).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
