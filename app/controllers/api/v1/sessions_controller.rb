class Api::V1::SessionsController < ApplicationController
  protect_from_forgery except: :create
  def create # sign in
    user = User.find_by(email: params[:email])

    if user && user.valid_password?(params[:password])
      render json: user.as_json(only: [:id, :email, :authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destory # sign out
    current_user && current_user.authentication_token = nil
    if current_user.save
      head: :ok
    else
      head: :unauthorized
    end
  end
end
