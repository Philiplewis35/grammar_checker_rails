class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def services
    @services = current_user.services.map(&:base_url)
    render json: @services, status: :ok
  rescue
    head(:unprocessable_entity)
  end

  private

  def user_params
    params.permit(:id)
  end
end
