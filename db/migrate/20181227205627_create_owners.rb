class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :password_digest
      t.boolean :admin , default: false
      t.integer :money
      t.timestamps
    end
  end
end
