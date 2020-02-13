class Admin::ServicesController < ApplicationController
  before_action :verify_admin

  def index
    @services = Service.all
  end

  def create
    permitted = params.require(:service).permit(:base_url)
    service = Service.new(permitted)
    if service.save
      flash[:success]= 'Service created'
    else
      flash[:error]= "Service could not be created<br>"
      service.valid?
      flash[:error] << service.errors.messages.values.join("<br>")
    end
    redirect_to admin_services_path
  # rescue
  #   flash[:error]= 'An error occured'
  #   redirect_to admin_services_path
  end

  def destroy
    service = Service.find(params[:id])
    service.destroy!
    flash[:notice]= 'Service Destroyed'
    redirect_to admin_services_path
  end

  private

  def verify_admin
    return if current_user.admin?
    flash[:error]= 'You do not have the correct permissions to access that page'
    redirect_to root_path
  end

end
