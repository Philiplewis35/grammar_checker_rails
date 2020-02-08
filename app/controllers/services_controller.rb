class ServicesController < ApplicationController

  def create
    service = Service.find_or_create_by!(base_url: params[:service][:base_url])
    user = User.find(params[:user_id])
    UserService.find_or_create_by!(user_id: user.id, service_id: service.id)
    flash[:notice]= 'Service Added'
    redirect_to authenticated_root_path
  end
end
