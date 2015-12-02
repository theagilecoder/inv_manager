class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @items = current_user.items
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"item-list.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
      format.json {  render json: @items}
      format.xml {  render xml: @items}
    end  
  end
  
  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "Inventory Item created. View Analysis below."
      redirect_to item_path(@item)
    else
      render 'static_pages/spage2'
    end
  end

  def show
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id #If a user is trying to view the show page of an item that doesn't belong to him, take him to Home page
      render 'static_pages/spage1'
    end  
  end
  
  def destroy
    @item.destroy
    flash[:success] = "Item deleted"
    redirect_to current_user
  end
  
  private

    def item_params
      params.require(:item).permit(:item_code, :description, :cost, :location, :uom, :service_level, :lead_time, :lead_time_variability, :df1, :df2, :df3, :df4, :df5, :df6, :df7, :df8, :df9, :df10, :df11, :df12, :as1, :as2, :as3, :as4, :as5, :as6, :hf1, :hf2, :hf3, :hf4, :hf5, :hf6, :ordered_quantity, :actual_quantity)
    end
    
    def correct_user
      @item = current_user.items.find_by(id: params[:id])
      redirect_to root_url if @item.nil?
    end
end