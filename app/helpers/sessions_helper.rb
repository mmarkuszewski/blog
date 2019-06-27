module SessionsHelper
  def is_logged?
    session.key?('user_id')
  end

  def current_user
      User.find(session[:user_id])
  end
end
