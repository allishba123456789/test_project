class AddNoOfUnitsUsedToUsage < ActiveRecord::Migration[5.2]
  def change
  	 add_column :usages, :no_of_units_used, :integer
  end
end
