# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :send_to_chrome_extension, only: :create
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def send_to_chrome_extension
    external = params['external_field']['external']
    return unless current_user && external == "true"
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:external_field, keys: [:external])
  end
end
