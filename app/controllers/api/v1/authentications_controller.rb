class Api::v1::AuthenticationsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
  end
end