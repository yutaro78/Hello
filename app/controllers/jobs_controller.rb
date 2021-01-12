class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_q, only: [:index, :search]
  before_action :authenticate_user!, only: [:show, :create]
  def new
    @job = Job.new
  end
  def create
    @job = Job.new(job_params)
    # @job = current_user.jobs.build(job_params)
    if @job.save
      redirect_to job_path(@job), notice: "投稿に成功しました。"
    else
      render :new
    end
  end
  def index
    
    @jobs = Job.page(params[:page]).per(6).order('id DESC')
  end
  def show
    @job = Job.find(params[:id])
    # @user = User.find(params[:id])
    @jobs = Job.order("id DESC").limit(5)
    @favorite = Favorite.new
  end
  def edit
    @job = Job.find(params[:id])
    if @job.user != current_user
        redirect_to jobs_path, alert: "不正なアクセスです。"
    end
  end
  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to job_path(@job), notice: "投稿を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    redirect_to user_path(job.user), notice: "投稿を削除しました。"
  end
  def search
    @results = @q.result
    @jobs = Job.page(params[:page]).per(6).order('id DESC')
    
  end

  private
  def set_q
    @q = Job.ransack(params[:q])
  end

  def job_params
    params.require(:job).permit(:title, :body,).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:username, :email, :profile)
  end

end