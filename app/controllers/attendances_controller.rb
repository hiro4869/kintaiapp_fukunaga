class AttendancesController < ApplicationController

  def index
    # @attendances = Attendance.all
    @attendances = Attendance.page(params[:page])
  end

  def create
    @attendance = Attendance.new
    @attendance.user_id = current_user.id
    @attendance.start = Time.now
    if @attendance.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update
    # @attendance = Attendance.where(user_id:"#{current_user.id}").last
    @attendance_end = current_user.attendances.last
    if @attendance_end.update(end: Time.now)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def approval
    @attendance = Attendance.find(params[:id]) 
    if @attendance.update(attendance_params)
      redirect_to root_path
    else
      redirect_to
    end
  end

  def approval_true
    @attendance = Attendance.find(params[:id]) 
    @attendance.update(attendance_params)
      # redirect_to root_path
  end

  def approval_false
    @attendance = Attendance.find(params[:id]) 
    @attendance.update(attendance_params)
      # redirect_to root_path
  end

  def application_new
    @attendance = Attendance.new    
  end

  def application_create
    @attendance = Attendance.new(attendance_params)
    @attendance.user_id = current_user.id
    if @attendance.save(context: :application_create)
      redirect_to root_path
    else
      @error = "全ての項目を記入してください。"
      render 'attendances/application_new'
    end
  end

  private
    def attendance_params
      params.require(:attendance).permit(:id,:start, :end, :approval)
    end

end


