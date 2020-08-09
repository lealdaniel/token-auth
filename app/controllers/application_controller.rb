class ApplicationController < ActionController::API
  before_action :authenticate_request
 
  private
 
  def authenticate_request
    header = request.headers['Authorization']
    if header 
      header = header.split(' ').last
      decoded = JsonWebToken.decode(header)
    end
    if decoded
      @current_user = User.find(decoded[:user_id])
    else
      render json: { error: 'Unauthorized or missing token' }, status: :unauthorized
    end
  end
end