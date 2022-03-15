class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :detail_category_id, :detail_status_id, :delivery_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

end
