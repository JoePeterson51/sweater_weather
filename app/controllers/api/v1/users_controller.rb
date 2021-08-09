class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] != params[:password_confirmation]
      render json: {error: "Password must match password confirmation"}, status: 401
    elsif User.find_by(email: params[:email])
      render json: {error: "Email already exists"}, status: 409
    else
      user = User.create(user_params)
      if user.save
        user.api_key
        render json: UserSerializer.new(user).serializable_hash.to_json, status: 201
      else
        render json: {error: "Unprocessable Entity"}, status: 422
      end
    end
  end

private
  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end