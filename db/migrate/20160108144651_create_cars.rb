class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :no
      t.string :make
      t.string :model
      t.string :name
      t.string :sell_name
      t.integer :sell_price
      t.string :short
      t.string :long
      t.string :year
      t.string :register
      t.string :vin
      t.string :engine
      t.string :seller
      t.string :bought
      t.string :price
      t.date   :register
      t.string :register_cost
      t.string :plate
      t.date   :police
      t.string :police_comment
      t.date   :dot
      t.string :exporter
      t.date   :usa

      t.timestamps null: false
    end
  end
end
