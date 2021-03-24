class ApplicationController < ActionController::Base
  add_flash_types :success, :error

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def flash_error_message(message=nil)
    flash[:error] = message.blank? ? I18n.t('alert.error') : message
  end

  def success_message(object, status = :created)
    I18n.t('alert.success', class_name: object.class.name.titleize, status: status.to_s)
  end
end
