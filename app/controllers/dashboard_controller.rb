class DashboardController < ApplicationController
  def index
    @users = user.all
  end
end
