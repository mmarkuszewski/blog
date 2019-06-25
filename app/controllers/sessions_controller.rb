class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  def login(user)
    session[:user_id] = user.id
    set_current_user(user)
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def set_current_user(user)
    @current_user = user
  end
end
