class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @job = Job.new
  end
  def create
    @job = current_user.jobs.build(job_params)
    if @job.save
      redirect_to job_path(@job), notice: "投稿に成功しました。"
    else
      render :new
    end
  end
  def index
    @jobs = Job.all.order(id: "DESC")
  end
  def show
    @job = Job.find(params[:id])
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

  private
  def job_params
    params.require(:job).permit(:title, :body,)
  end
end