class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user, index: true, foreign_key: true
      t.string :item_code
      t.string :description
      t.decimal :cost
      t.string :location
      t.string :uom
      t.decimal :service_level
      t.decimal :lead_time
      t.decimal :lead_time_variability
      t.decimal :df1
      t.decimal :df2
      t.decimal :df3
      t.decimal :df4
      t.decimal :df5
      t.decimal :df6
      t.decimal :df7
      t.decimal :df8
      t.decimal :df9
      t.decimal :df10
      t.decimal :df11
      t.decimal :df12
      t.decimal :as1
      t.decimal :as2
      t.decimal :as3
      t.decimal :as4
      t.decimal :as5
      t.decimal :as6
      t.decimal :hf1
      t.decimal :hf2
      t.decimal :hf3
      t.decimal :hf4
      t.decimal :hf5
      t.decimal :hf6
      t.decimal :ordered_quantity
      t.decimal :actual_quantity
      t.decimal :mape
      t.decimal :bias
      t.decimal :supply_uncertainty
      t.decimal :transit_time_variability
      t.decimal :safety_stock
      t.decimal :safety_stock_1
      t.decimal :safety_stock_2
      t.decimal :safety_stock_3

      t.timestamps null: false
    end
  end
end
