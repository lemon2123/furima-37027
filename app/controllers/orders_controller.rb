class OrdersController < ApplicationController

  def index
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(order_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:record_address).permit(:post_code, :delivery_area_id, :delivery_city, :delivery_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end