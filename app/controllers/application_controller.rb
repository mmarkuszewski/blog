class ApplicationController < ActionController::Base

  #dodane dla cancancan
  def current_user
    if session.key?("user_id")
      User.find(session[:user_id])
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

end
