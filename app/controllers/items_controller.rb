class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "Inventory Item created!"
      redirect_to root_url
    else
      render 'static_pages/spage1'
    end
  end

  def destroy
  end
  
  private

    def item_params
      params.require(:item).permit(:item_code, :description, :cost, :location, :uom, :service_level, :lead_time, :lead_time_variability, :df1, :df2, :df3, :df4, :df5, :df6, :df7, :df8, :df9, :df10, :df11, :df12, :as1, :as2, :as3, :as4, :as5, :as6, :hf1, :hf2, :hf3, :hf4, :hf5, :hf6, :ordered_quantity, :actual_quantity)
    end
end
