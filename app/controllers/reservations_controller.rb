class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @reservations }
      format.json { render json: @reservations }
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.destination_id = 1 # params[:destination_id]
    @reservation.user = User.first # current_user

    if @reservation.save
      redirect_to :root, notice: 'Reservation was successfully created.'
    else
      redirect_to :root, alert: @reservation.errors.full_messages.join('. ').to_s
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to :root, notice: 'Your reservation has been deleted'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:startingDay, :endingDay)
  end
end
