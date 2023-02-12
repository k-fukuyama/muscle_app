class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, if: :devise_controller?

  def sign_up_params
    params.require(:registration).permit(:name,:email, :img, :password, :password_confirmation, :address)
  end
end
