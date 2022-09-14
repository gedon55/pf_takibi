class PostsController < ApplicationController
  def new
    @post=Post.new
  end
  
  def create
    post=Post.new(post_params)
    post.save
    redirect_to '/'
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  # ストロングパラメーター
  def post_params
    params.require(:post).permit(:title, :body, :place, :day, :price, :member)
  end
end
