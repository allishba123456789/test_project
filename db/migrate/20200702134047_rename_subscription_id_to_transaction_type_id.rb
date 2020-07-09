class RenameSubscriptionIdToTransactionTypeId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :transactions, :subscription_id, :transaction_type_id
  end
end
