class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :name
      t.string :caption
      t.string :car_id
    end
    add_index :pics, :car_id
  end
end
