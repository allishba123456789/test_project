class RemoveFeatureIdFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :feature_id, :integer
  end
end
