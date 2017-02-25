class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: :json_request?
  before_action :check_jwt_for_cookies

  def json_request?
    request.format.json?
  end

  def check_jwt_for_cookies
    user_jwt = cookies[:user_jwt]
    user_id = JwtAuth.decode_jwt(user_jwt)["user_id"].to_i
    @current_user = User.find(user_id)
    if @current_user.blank?
      render json: { success: false }, status: :unauthorized and return
    end
  end

  def current_user
    @current_user
  end

end
