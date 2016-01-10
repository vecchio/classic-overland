class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string  :no
      t.string  :unique
      t.text    :notes
      t.text    :refurb
      t.text    :accessories
      t.integer :stage         # 10=bought 20=refurb 30=waiting to ship 40 on ship 50 arrived 60 cleared 80 advertised 90 sold
      t.string  :make
      t.string  :model
      t.string  :name
      t.string  :sell_name
      t.string  :short
      t.text  :long
      t.string  :year
      t.string  :register
      t.string  :vin
      t.string  :engine
      t.string  :seller
      t.date    :bought
      t.decimal :price
      t.date    :enatis
      t.decimal :enatis_cost
      t.string  :plate
      t.date    :police
      t.string  :police_comment
      t.date    :dot
      t.date    :exporter
      t.decimal :ship_cost
      t.decimal :refurb_cost
      t.date    :usa_arrive
      t.decimal :usa_ask
      t.decimal :usa_price
      t.date    :usa_sold

      t.timestamps null: false
    end
    add_index :cars, :unique
  end
end
