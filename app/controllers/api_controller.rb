class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_default_format, :authenticate_api_v1_user!

  private

  def set_default_format
    request.format = :json
  end
end
