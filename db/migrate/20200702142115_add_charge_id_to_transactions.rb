class AddChargeIdToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :charge_id, :integer
  end
end
