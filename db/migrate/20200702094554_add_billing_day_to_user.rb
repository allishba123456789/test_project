class AddBillingDayToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :billing_day, :integer
  end
end
