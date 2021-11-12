class Api::V1::ReservationsController < ApiController
  def index
    @reservations = Reservation.all
    # respond_to do |format|authenticate_user!
    #   format.html # index.html.erb
    #   format.xml { render xml: @reservations }
    #   format.json { render json: @reservations }
    # end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    # @reservation.destination_id = params[:destination_id] (will be needed if id is in )
    @token = request.headers.fetch('Authorization', '').split.last
    @user_id = JsonWebToken.decode(@token).first
    @reservation.user_id = User.find(@user_id.last)
    # @reservation.destination_id = 1 # params[:destination_id]
    # @reservation.user = User.first # current_user

    # @reservation = current_user.reservations.build(reservation_params)

    if @reservation.save
      render json: { reservation: @reservation }
    else
      render json: { errors: @reservation.errors }
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    render json: { message: 'Reservation succesfully removed' }
  end

  private

  def reservation_params
    params.require(:reservation).permit(:destination_id, :startingDay, :endingDay)
  end
end
