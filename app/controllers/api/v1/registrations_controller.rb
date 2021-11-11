class Api::V1::RegistrationsController < ApplicationController
  before_action :create_user

  def create
  end

  private

  def create_user
    @user = User.new(user_params)
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end