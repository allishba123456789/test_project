class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_type, :role
  end
end
