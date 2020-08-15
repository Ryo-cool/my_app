class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @users=User.all
  end
  
  def show
    @user = User.find(params[:id])
    @nickname = current_user.name
    @posts = @user.posts.order("created_at DESC")
    # @user = @post.user
    # @posts = @user.posts
  end
  
  
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      flash[:alert] = "必須項目をご確認ください。"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end