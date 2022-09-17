class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.users_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def index
    @posts = Post.all
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
    redirect_to post_path(post.id)  
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/posts'
  end
  
  def search
    if params[:place].present?
      @posts = Post.where('place LIKE ?', "%#{params[:place]}%")
    else
      @posts = Post.none
    end
  end

  private
  # ストロングパラメーター
  def post_params
    params.require(:post).permit(:title, :body, :place, :in_day, :out_day, :price, :member, :image, :users_id)
  end
end
