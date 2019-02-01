class CreateOwnerFarms < ActiveRecord::Migration[5.2]
  def change
    create_table :owner_farms do |t|
      t.integer :owner_id
      t.integer :farm_id

      t.timestamps
    end
  end
end
