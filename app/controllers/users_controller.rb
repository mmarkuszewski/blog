class UsersController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(role:'user'))
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end



end
