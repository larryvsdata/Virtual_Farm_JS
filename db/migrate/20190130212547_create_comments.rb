class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.integer :likes , default: 0
      t.integer :dislikes , default: 0
      t.timestamps
    end
  end
end
