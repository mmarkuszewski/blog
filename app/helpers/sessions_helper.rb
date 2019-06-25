module SessionsHelper
  def is_logged?
    session.key?('user_id')
  end
end
