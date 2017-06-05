class AddColumnToAttendance < ActiveRecord::Migration[5.0]
  def change
    add_column :attendances, :approval, :boolean
  end
end
