class Api::V1::ServicesController < ApplicationController
  def index
    render json: current_user.services.map(&:base_url), status: :ok
  end
end
