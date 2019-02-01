class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :unit_price
      t.integer :quantity
      t.integer :farm_id

      t.timestamps
    end
  end
end
