class ItemsController < ApplicationController

  def index
    # ↓ログインしている人の投稿のみ
    @items = current_user.items
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to items_path(current_user.id)
    else
      @user = current_user
      @items = current_user.items
      render "index"
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end
  
  private
  # ストロングパラメーター
  def item_params
    params.require(:item).permit(:image, :user_id, :item_name)
  end
  
end

