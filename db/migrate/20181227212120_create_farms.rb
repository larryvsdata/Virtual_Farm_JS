class CreateFarms < ActiveRecord::Migration[5.2]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :description
      t.boolean :available , default: true
      t.timestamps
    end
  end
end
