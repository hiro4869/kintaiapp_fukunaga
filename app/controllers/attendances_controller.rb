class AttendancesController < ApplicationController

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
    @attendance = Attendance.where(user_id:"#{current_user.id}").last
    @attendance.end = Time.now
    if @attendance.update(attendance_params)
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

  def attendance_params
    params.require(:attendance).permit(:user_id, :start ,:end)
  end

end
