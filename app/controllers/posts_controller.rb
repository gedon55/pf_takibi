class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render "new"
    end
  end

  def index
    if params[:place].present?
      @posts = Post.published.where('place LIKE ?', "%#{params[:place]}%")
    else
      @posts = Post.published
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/posts'
  end

  private
  # ストロングパラメーター
  def post_params
    params.require(:post).permit(:title, :body, :place, :in_day, :out_day, :price, :member, :user_id, :is_published_flag, images: [])
  end
end
