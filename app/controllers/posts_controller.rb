class PostsController < ApplicationController
  def new
    @post=Post.new
  end
  
  def create
    post=Post.new(post_params)
    post.save
    redirect_to "/posts"
  end

  def index
    @posts=Post.all
  end

  def show
  end

  def edit
  end
  
  private
  # ストロングパラメーター
  def post_params
    params.require(:post).permit(:title, :body, :place, :in_day, :out_day, :price, :member, :image)
  end
end
