class AddMaxColumnLimitToFeatures < ActiveRecord::Migration[5.2]
  def change
    add_column :features, :max_no_of_units, :integer
  end
end
