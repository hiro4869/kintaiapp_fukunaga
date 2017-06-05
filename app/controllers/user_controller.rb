class UserController < ApplicationController
  before_action :authenticate_admin!, only: :new
  before_action :set_user, only: [:show, :edit, :update, :pass_change, :pass_update]

  def show
    @attendance = Attendance.new
    if Attendance.where(user_id:"#{current_user.id}").exists?
      @attendance_end = Attendance.where(user_id:"#{current_user.id}").last
    else
      @attendance_end = Attendance.new
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
     #管理ユーザーにメールを送信
     adminuser = @adminuser
     RegistrationMailer.registration_email(adminuser, @user).deliver

     #ユーザーにメールを送る
       user_email = @user.email
       RegistrationMailer.registration_email(user_email, @user).deliver
       redirect_to root_path
     else
       render '/user/new'
     end
  end

  def edit
  end

  def update
      if @user.update(user_params)
        redirect_to root_path
      else
        @error = "全ての項目を記入してください。"
        render '/user/edit'
      end
  end

  def pass_change
  end

  def pass_update
      if @user.update(user_params)
        redirect_to root_path
      else
        render '/user/pass_change'
      end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :name, :birth, :sex, :status, :address, :phone, :password_confirmation)
    end

end
