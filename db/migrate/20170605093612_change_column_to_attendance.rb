class ChangeColumnToAttendance < ActiveRecord::Migration[5.0]
  # 変更内容
  def up
    change_column :attendances, :approval, :boolean, default: false
  end

  # 変更前の状態
  def down
    change_column :attendances, :approval, :boolean
  end
end
