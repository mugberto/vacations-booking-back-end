# frozen_string_literal: true

class Api::V1::Users::RegistrationsController < ApiController
  skip_before_action :authenticate_api_v1_user!, only: [:create]

  # POST /resource
  def create
    @user = User.new(user_params)
    @user.admin = false
    if @user.save
      render json: { message: "User successfully registered!", token: JsonWebToken.encode(sub: @user.id), }
    else
      render json: { errors: ['Registration failed!', @user.errors] }
    end
  end

  # private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, admin: false)
  end
end
