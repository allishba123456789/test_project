class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.integer :plan_id
      t.string :name
      t.string :code
      t.decimal :unit_price

      t.timestamps
    end
  end
end
