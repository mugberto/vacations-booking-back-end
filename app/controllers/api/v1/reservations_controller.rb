class Api::V1::ReservationsController < ApiController
  def index
    @reservations = current_user.reservations
    # respond_to do |format|authenticate_user!
    #   format.html # index.html.erb
    #   format.xml { render xml: @reservations }
    #   format.json { render json: @reservations }
    # end
    if user_signed_in?
      render json: { reservations: @reservations, user_signed_in: user_signed_in?, current_user: current_user}
    else 
      renser json: {errors: 'You are not logged in'}
    end
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)

    if @reservation.save
      render json: { reservation: @reservation, message: 'Reservation created!' }
    else
      render json: { errors: @reservation.errors }
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    render json: { message: 'Reservation succesfully removed', reservations: @reservations}
  end

  private

  def reservation_params
    params.permit(:destination_id, :startingDay, :endingDay)
  end
end
