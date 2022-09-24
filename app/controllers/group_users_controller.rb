class GroupUsersController < ApplicationController

  def update
    group_user = GroupUser.find(params[:id])
    group_user.update(group_user_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def group_user_params
    params.require(:group_user).permit(:status)
  end

end
