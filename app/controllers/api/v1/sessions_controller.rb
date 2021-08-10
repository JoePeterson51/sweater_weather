class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user).serializable_hash.to_json, status: 201
    else
      render json: {error: "Incorrect Email/Password"}, status: 403
    end
  end
end