class CreateUsages < ActiveRecord::Migration[5.2]
  def change
    create_table :usages do |t|
      t.integer :subscription_id
      t.integer :feature_id

      t.timestamps
    end
  end
end
