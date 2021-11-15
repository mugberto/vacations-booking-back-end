class Users::SessionsController < Devise::SessionsController
  # include  ApiController
  # skip_before_action :authenticate_user!
  def create
    @user = User.find_by(email: params[:email])

    if @user.valid_password? params[:password]
      session[:@user_id] = user.id
      render json: { message: "User loged in successfully!", token: JsonWebToken.encode(sub: @user.id) }
    else
      render json: { errors: ['Invalid email or password'] }
    end
  end
end
