class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :name
      t.string :caption
      t.string :car_id

      t.boolean :is_active     , default: true
      t.boolean :is_signature  , default: false

      t.attachment :photo

      t.timestamps null: false
    end
    add_index :pics, :car_id
  end
end
