module SpecTestHelper
  def login_admin
    login(create :admin)
  end

  def login_user
    login(create :user)
  end

  def login(user)
    session[:user_id] = user.id
  end
end
