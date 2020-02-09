class UsersController < ApplicationController

  def add_services
    user = User.find(params[:user_id])
    params[:services].each do |service_id|
      service = Service.find(service_id)
      UserService.find_or_create_by!(user_id: user.id, service_id: service.id)
    end
    flash[:notice]= 'Services Added'
    redirect_to authenticated_root_path
  end

  def remove_service
    user = User.find(params[:user_id])
    service = Service.find(params[:service_id])
    UserService.find_by!(user_id: user.id, service_id: service.id).destroy!
    flash[:notice]= 'Service Removed'
    redirect_to authenticated_root_path
  end
end
