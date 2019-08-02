class ApplicationController < ActionController::Base

  # przekierowanie gdy nie ma dostępu
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  def index
    respond_to do |format|
      format.html {render file: "layouts/application"}
    end
  end

end
