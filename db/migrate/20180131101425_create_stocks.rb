class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.decimal :last_price
      t.decimal :change
      t.decimal :percentage_change
      t.decimal :volume
      t.decimal :market_volume

      t.timestamps
    end
  end
end
