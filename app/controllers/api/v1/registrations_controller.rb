class Api::V1::RegistrationsController < ApiController
  skip_before_action :authenticate_user!

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { token: JsonWebToken.encode(sub: @user.id) }
    else
      render json: { errors: 'Registration failed!' }
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end