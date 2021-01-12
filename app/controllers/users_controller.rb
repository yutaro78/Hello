class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_q, only: [:index, :search]
  before_action :authenticate_user!, only: [:show, :create]
  def index
    @users = User.page(params[:page]).per(8).order('id DESC')
    @jobs = Job.page(params[:page]).per(6).order('id DESC')
  end
  def show
    @user = User.find(params[:id])
    @jobs = Job.page(params[:page]).per(4).order('id DESC')
  end
  def edit
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  def search
    @results = @q.result
    @users = User.page(params[:page]).per(6).order('id DESC')
    
  end

  private
  def set_q
    @q = User.ransack(params[:q])
  end

  def user_params
    params.require(:user).permit(:username, :email, :profile)
  end
end
