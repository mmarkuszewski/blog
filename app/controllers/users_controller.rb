class UsersController < ApplicationController

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.authenticate(params[:user][:old_password])
      if @user.update_attributes(user_params)
        redirect_to root_url
      else
        return render 'edit'
      end
    else
      @user.errors.add(:Old, "password is wrong")
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end


end
