class HomeController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @services = Service.all
  end
end
