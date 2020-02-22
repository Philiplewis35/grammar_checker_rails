class Api::V1::ServicesController < ApplicationController
  def index
    services = current_user&.services&.map(&:base_url)
    if services
      render json: services, status: :ok
    else
      head(:unauthorized)
    end
  end
end
