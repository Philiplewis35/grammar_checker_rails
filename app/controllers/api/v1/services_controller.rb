class Api::V1::ServicesController < ApplicationController
  def index
    services = find_user&.services&.map(&:base_url)
    if services
      render json: services, status: :ok
    else
      head(:unauthorized)
    end
  end

  private

  def find_user
    User.find_by(email: request.env['HTTP_X_USER_EMAIL'], authentication_token: request.env['HTTP_X_USER_TOKEN'])
  end
end
