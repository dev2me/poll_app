class Api::V1::UsersController < ApplicationController
  #POST /users
  def create
    #auth
    if !params[:auth]
      render json: { error: "No encontramos el parametro auth"}
    else
      @user = User.from_omniauth(params[:auth])
      @token = @user.tokens.create()
      render "api/v1/users/show"
    end
  end
end
