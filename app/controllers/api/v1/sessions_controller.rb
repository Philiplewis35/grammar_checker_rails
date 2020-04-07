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
    find_user&.authentication_token = nil
    if find_user&.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end

  def session_status
    find_user ? head(:ok) : head(:not_found)
  end

  private

  def find_user
    User.find_by(email: request.env['HTTP_X_USER_EMAIL'], authentication_token: request.env['HTTP_X_USER_TOKEN'])
  end
end
