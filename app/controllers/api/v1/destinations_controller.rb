class Api::V1::DestinationsController < ApiController
  skip_before_action :authenticate_api_v1_user!, only: [:index]
  before_action :authenticate_admin!, only: [:create, :delete]

  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def create
    Destination.create!(dest_params)
    render json: { status: 'Success!', message: 'Destination created successfully ' }
  rescue ActiveRecord::RecordInvalid => e
    render json: { status: 'Error!', message: e.record.errors }
  end

  def destroy
    Destination.find(params[:id]).destroy!
    render json: { status: 'Success!', message: 'Destination deleted successfully ' }
  rescue ActiveRecord::RecordNotDestroyed => e
    render json: { status: 'Error!', message: e.record.errors }
  end

  private

  def dest_params
    params.permit(:name, :location, :image_url, :price_per_day)
  end

  def authenticate_admin!
    render json: { status: 'Error!', message: "You don't have authorization to create new destination!"} unless current_api_v1_user.admin
  end
end
