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
    # @attendance = Attendance.where(user_id:"#{current_user.id}").last
    @attendance_end = current_user.attendances.last
    if @attendance_end.update(end: Time.now)
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

end


