class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string  :picable_type
      t.integer :picable_id
      t.string  :name
      t.string  :caption

      t.boolean :is_landscape  , default: true
      t.integer :stage         , default: 9     # 1=before  5=while   9=after

      t.boolean :is_active     , default: true
      t.boolean :is_signature  , default: false

      t.attachment :photo

      t.timestamps null: false
    end
    add_index :pics, [:picable_type, :picable_id]
    add_index :pics, [:picable_id, :picable_type]
  end
end
