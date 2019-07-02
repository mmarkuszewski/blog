class ApplicationController < ActionController::Base
  before_action :get_current_user

  #dodane dla cancancan
  def current_user
    if session.key?("user_id")
      @current_user ||= User.find(session[:user_id])
    end
  end

  # przekierowanie gdy nie ma dostępu
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  def get_current_user
    if session.key?("user_id")
      @current_user ||= User.find(session[:user_id])
    end
  end

end
