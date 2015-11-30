class Item < ActiveRecord::Base
  belongs_to :user
  before_create :calculate_all_values
  
  validates :user_id, presence: true
  validates :item_code, presence: true, length: { maximum: 10 }
  validates :description, presence: true, length: { maximum: 10 }
=begin  
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
=end  

  private
  
  A1 =  -39.6968302866538
  A2 =  220.946098424521
  A3 = -275.928510446969
  A4 =  138.357751867269
  A5 =  -30.6647980661472
  A6 =    2.50662827745924
  B1 =  -54.4760987982241
  B2 =   161.585836858041
  B3 = -155.698979859887
  B4 =   66.8013118877197 
  B5 =  -13.2806815528857 
  C1 =   -7.78489400243029E-03
  C2 =   -0.322396458041136 
  C3 =   -2.40075827716184 
  C4 =   -2.54973253934373
  C5 =    4.37466414146497 
  C6 =    2.93816398269878 
  D1 =    7.78469570904146E-03
  D2 =    0.32246712907004 
  D3 =    2.445134137143 
  D4 =    3.75440866190742
  P_low = 0.02425 
  P_high = 1 - P_low

  def calculate_all_values
    
    self.mape = (((self.as1-self.hf1).abs + (self.as2-self.hf2).abs + (self.as3-self.hf3).abs + (self.as4-self.hf4).abs + (self.as5-self.hf5).abs + (self.as6-self.hf6).abs).to_f/(as1 + as2 + as3 + as4 + as5 + as6)).round(3) 
    self.bias = (((self.hf1-self.as1) + (self.hf2-self.as2) + (self.hf3-self.as3) + (self.hf4-self.as4) + (self.hf5-self.as5) + (self.hf6-self.as6)).to_f/(as1 + as2 + as3 + as4 + as5 + as6)).round(3)
    self.supply_uncertainty = ((self.ordered_quantity - self.actual_quantity).to_f/self.ordered_quantity).round(3)
    self.transit_time_variability = ((self.lead_time_variability).to_f/self.lead_time).round(3)
    
    def phi(p)
      raise ArgumentError if p < 0 || p > 1
      if p < P_low
        q = (-2 * Math::log(p))**0.5
        (((((C1 * q + C2) * q + C3) * q + C4) * q + C5) * q + C6) / 
        ((((D1 * q + D2) * q + D3) * q + D4) * q + 1)
      elsif p <= P_high
        q = p - 0.5
        r = q * q
        (((((A1 * r + A2) * r + A3) * r + A4) * r + A5) * r + A6) * q / 
        (((((B1 * r + B2) * r + B3) * r + B4) * r + B5) * r + 1)
      else
        q = (-2 * Math::log(1 - p))**0.5
        (((((C1 * q + C2) * q + C3) * q + C4) * q + C5) * q + C6) / 
        ((((D1 * q + D2) * q + D3) * q + D4) * q + 1)
      end
    end
    
    self.safety_stock = (phi(self.service_level) * (self.mape**2 + (self.transit_time_variability**2 + self.supply_uncertainty**2)**0.5)**0.5 * self.lead_time).round(3) - (self.lead_time * self.bias).round(3) 
    
    self.safety_stock_1 = (self.safety_stock * (self.df1 + self.df2 + self.df3 + self.df4)/28).round(3)
    self.safety_stock_2 = (self.safety_stock * (self.df5 + self.df6 + self.df7 + self.df8)/28).round(3)
    self.safety_stock_3 = (self.safety_stock * (self.df9 + self.df10 + self.df11 + self.df12)/28).round(3)
  end  
end