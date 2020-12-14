class HomeController < ApplicationController
  def index
    @jobs = Job.order("id DESC").limit(4)
    @users = User.all
  end
end
