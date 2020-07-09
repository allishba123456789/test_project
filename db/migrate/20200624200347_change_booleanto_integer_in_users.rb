class ChangeBooleantoIntegerInUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :user_type, :integer
  end

  def down
    change_column :users, :user_type, :boolean
  end
end
