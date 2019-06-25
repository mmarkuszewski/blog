module UsersHelper
  def is_admin?
    if User.exists?(session[:user_id])
      User.find(session[:user_id]).role == 'admin'
    end
  end
end
