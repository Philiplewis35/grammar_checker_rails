class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create # sign in
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      render json: user.as_json(only: [:email, :authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy # sign out
    current_user&.authentication_token = nil
    if current_user&.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end

  def session_status
    current_user ? head(:ok) : head(:not_found)
  end
end
