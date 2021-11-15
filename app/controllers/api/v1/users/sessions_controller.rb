# frozen_string_literal: true

class Api::V1::Users::SessionsController < ApiController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :authenticate_api_v1_user!, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in

  def create
    @user = User.find_by(email: params[:email])
    if @user and @user.valid_password? params[:password]
      sign_in(@user)
      # session[:@user_id] = @user.id
      render json: { message: "User loged in successfully!", token: JsonWebToken.encode(sub: @user.id), current_user_signed?: api_v1_user_signed_in?, current_user: current_api_v1_user.id
      }
    else
      render json: { errors: ['Invalid email or password'] }
    end
  end

  # DELETE /resource/sign_out
  def destroy
    # if api_v1_user_signed_in?
    #   render json: {message: "not signed out yet"}
    # Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    # session[current_api_v1_user] = nil
    # # session[current_user.id] = nil
    # render json: {current_user_signed?: api_v1_user_signed_in?, message: "Session destroyed!", current_user: current_api_v1_user}
    # else
    #   render json: {message: "You are not logged out"}
    # end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
