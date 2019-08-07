class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.paginate(page: params[:page], per_page: 4)
    render json: @users
  end

  def destroy
    User.find(params[:id]).destroy
  end

end
