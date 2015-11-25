class Item < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :item_code, presence: true, length: { maximum: 10 }
  validates :description, presence: true, length: { maximum: 20 }
  validates :cost, presence: true
  validates :location, presence: true, length: { maximum: 10 }
  validates :uom, presence: true, length: { maximum: 10 }
  validates :service_level, presence: true
  validates :lead_time, presence: true
  validates :lead_time_variability, presence: true
  validates :df1, presence: true
  validates :df2, presence: true
  validates :df3, presence: true
  validates :df4, presence: true
  validates :df5, presence: true
  validates :df6, presence: true
  validates :df7, presence: true
  validates :df8, presence: true
  validates :df9, presence: true
  validates :df10, presence: true
  validates :df11, presence: true
  validates :df12, presence: true
  validates :as1, presence: true
  validates :as2, presence: true
  validates :as3, presence: true
  validates :as4, presence: true
  validates :as5, presence: true
  validates :as6, presence: true
  validates :hf1, presence: true
  validates :hf2, presence: true
  validates :hf3, presence: true
  validates :hf4, presence: true
  validates :hf5, presence: true
  validates :hf6, presence: true
  validates :ordered_quantity, presence: true
  validates :actual_quantity, presence: true
  validates :mape, presence: true
  validates :bias, presence: true
  validates :supply_uncertainty, presence: true
  validates :transit_time_variability, presence: true
  validates :safety_stock, presence: true
  validates :safety_stock_1, presence: true
  validates :safety_stock_2, presence: true
  validates :safety_stock_3, presence: true
  
end