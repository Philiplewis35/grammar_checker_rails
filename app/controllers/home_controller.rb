class HomeController < ApplicationController

  def show
    @user = current_user
    @services = Service.all
  end
end
