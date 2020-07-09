class AddDayToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :date, :Date
  end
end
