class ApplicationController < ActionController::API
  before_action :authenticate_request
 
  private
 
  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    @decoded = JsonWebToken.decode(header)
    @current_user = User.find(@decoded[:user_id]) 
  end
end