module UsersHelper
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def is_admin?(user)
    user.role == 'admin'
  end
end
