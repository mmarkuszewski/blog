class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if !@user
      @user = User.new
      @user.errors.add(:User, "with this name doesn't exist")
      return render 'new'
    end
    if @user.authenticate(params[:session][:password])
      login(@user)
      redirect_to root_path
    else
      @user.errors.add(:Wrong, "password")
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
  end

end
