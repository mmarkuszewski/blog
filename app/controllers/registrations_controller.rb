class RegistrationsController < Devise::RegistrationsController
  after_action :send_csrf_token, :send_flash_msg
  clear_respond_to
  respond_to :json

  def send_csrf_token
    response.set_header("csrf", form_authenticity_token)
  end

  def response_with_user_abilities
    response['rules'] = Ability.new(resource).to_list.to_json
  end

  def send_flash_msg
    response['flash_notice'] = flash.notice
  end

  #nadpisana metoda z devise controller tak aby zawsze wywoływała flash now
  def set_flash_message!(key, kind, options = {})
    message = find_message(kind, options)
    flash.now[key] = message if message.present?
  end

end