class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :no
      t.string :make
      t.string :model
      t.string :name
      t.string :sell_name
      t.decimal :sell_price
      t.string :short
      t.string :long
      t.string :year
      t.string :register
      t.string :vin
      t.string :engine
      t.string :seller
      t.date :bought
      t.decimal :price
      t.date   :enatis
      t.decimal :enatis_cost
      t.string :plate
      t.date   :police
      t.string :police_comment
      t.date   :dot
      t.string :exporter
      t.decimal :ship_cost
      t.decimal :refurb_cost
      t.date   :usa

      t.timestamps null: false
    end
  end
end
