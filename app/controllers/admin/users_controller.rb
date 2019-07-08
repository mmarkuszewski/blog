class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end

end
