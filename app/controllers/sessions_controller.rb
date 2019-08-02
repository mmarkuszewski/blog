class SessionsController < Devise::SessionsController

  after_action :send_csrf_token, :response_with_user_abilities
  clear_respond_to
  respond_to :json

  def send_csrf_token
    response.set_header("csrf", form_authenticity_token)
  end

  def response_with_user_abilities
    response['abilities'] = Ability.new(resource).permissions
  end

  def flash_msg
    response['msg'] = flash.notice
  end

end