class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = @user.posts #ユーザーに関連付けられた投稿すべて取得して@postsに
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end
  
  

  
  private
  
  def user_params
    params.require(:user, :post).permit(:name, :profile_image, :place)
  end
end
