class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def index
    @post = Post.new
    @group = Group.all
  end

  def show
    @post = Post.new
    @group = Group.find(params[:id])
  end

  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to  groups_path
  end

  def create
    @group = current_user.owned_groups.new(group_params)
    @group.owner_id = current_user.id
    # @group.usersにcurrent_userに追加している記述
    @group.users << current_user
    if @group.save
      redirect_to groups_path
    else
      render "index"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end

  def destroy
    @group = Group.find(params[:id])
    # current_userは、@group.usersから消される記述
    @group.users. delete(current_user)
    redirect_to groups_path
  end

  def all_destroy
    @group = Group.find(params[:group_id])
    if @group.destroy
    redirect_to groups_path
    end
  end

  def search
    if params[:name].present?
      @groups = Group.where('name LIKE ?', "%#{params[:name]}%")
    else
      @groups = Group.none
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image, :status)
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
end
