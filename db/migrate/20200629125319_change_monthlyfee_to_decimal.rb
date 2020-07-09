class ChangeMonthlyfeeToDecimal < ActiveRecord::Migration[5.2]
  def change
  	change_column :plans, :monthly_fee, :decimal
  end
end
