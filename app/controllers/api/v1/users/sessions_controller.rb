# frozen_string_literal: true

class Api::V1::Users::SessionsController < ApiController
  skip_before_action :authenticate_api_v1_user!, only: [:create]

  # POST /resource/sign_in

  def create
    @user = User.find_by(email: params[:email])
    if @user and @user.valid_password? params[:password]
      sign_in(@user)
      render json: { message: "User loged in successfully!", token: JsonWebToken.encode(sub: @user.id), current_user_signed?: api_v1_user_signed_in?, current_user: current_api_v1_user.id
      }
    else
      render json: { errors: ['Invalid email or password'] }
    end
  end

  # DELETE /resource/sign_out
  def destroy    
    if api_v1_user_signed_in?      
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    render json: { message: "You are successfully loged out!"}
    else
      render json: {message: "You are not logged in!" }
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
