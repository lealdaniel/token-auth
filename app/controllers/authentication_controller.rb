class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    user_info = request.env["omniauth.auth"]
    user = User.from_omniauth(user_info)
    token = authenticate_user(user)

    if token
      render json: { auth_token: token }
    else
      render json: { error: 'Problem generating token, try again!' }
    end

  end

  private

  def authenticate_user(user)
    JsonWebToken.encode(user_id: user.id) if user
  end
end
