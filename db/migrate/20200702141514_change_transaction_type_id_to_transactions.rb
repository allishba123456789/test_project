class ChangeTransactionTypeIdToTransactions < ActiveRecord::Migration[5.2]
  def change
  	change_column :transaction, :transaction_type_id, :integer
  end
end
