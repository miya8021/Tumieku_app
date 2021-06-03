class ApplicationController < ActionController::Base
  # 全ページログイン必須
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image, :objective])
  end
end