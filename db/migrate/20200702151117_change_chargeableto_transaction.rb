class ChangeChargeabletoTransaction < ActiveRecord::Migration[5.2]
  def change
    change_table :transactions do |t|
      t.references :chargeable, polymorphic: true
    end
  end
end
