class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = Post.includes(:images).order('created_at DESC').limit(9)
    @images = Image.all
  end

  def new
    @post = Post.new
    @post.images.new
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
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to("/")
    flash[:alert] = "投稿が編集されました。"
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/")
    flash[:alert] = "投稿が削除されました。"
  end

  private
  def post_params
    params.require(:post).permit(:name, :text,images_attributes: [:src]).merge(user_id: current_user.id)
  end
end
