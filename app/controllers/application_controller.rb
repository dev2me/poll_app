class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate
  def authenticate
  	token_str = params[:token]
  	token = Token.find_by(token: token_str)

  	if token.nil? || !token.is_valid?
  		render json: {error: "Tu token es invalido", status: :unauthorized}
  	else
  		@current_user = token.user
  	end
  end
end
