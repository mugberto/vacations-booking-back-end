class Api::V1::ReservationsController < ApiController
  def index
    @reservations = current_api_v1_user.reservations
    if api_v1_user_signed_in?
      render json: { reservations: @reservations.to_a.map do |reservation|
                                     reservation.attributes.merge(cost: reservation.total_cost,
                                                                  name: reservation.destination.name)
                                   end }
    else
      renser json: { errors: ['You are not logged in!', @reservations.errors] }
    end
  end

  def create
    @reservation = current_api_v1_user.reservations.build(reservation_params)
    if @reservation.save
      render json: { status: 'Success!', message: 'Reservation successfully created!',
                     total_cost: @reservation.total_cost }
    else
      render json: { status: 'Error!', message: ['Creating reservation failed', @reservation.errors] }
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    render json: { status: 'Success!', message: 'Reservation succesfully removed', reservations: @reservations }
  end

  private

  def reservation_params
    params.permit(:destination_id, :startingDay, :endingDay)
  end
end
