class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birth, :integer
    add_column :users, :sex, :string
    add_column :users, :status, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
  end
end
