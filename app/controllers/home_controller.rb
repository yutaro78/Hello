class HomeController < ApplicationController
  def index
    @jobs = Job.order("id DESC").limit(6)
    @users = User.all
  end
end
