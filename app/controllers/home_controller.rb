class HomeController < ApplicationController
  before_action :authenticate_user!, except: :about

  def show
    @user = current_user
    @services = Service.all - @user.services
  end

  def about
  end
end
