class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_orders, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]
  before_action :buy_confirmation, only: [:index, :create]


  def index
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(order_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_orders
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:record_address).permit(:post_code, :delivery_area_id, :delivery_city, :delivery_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    redirect_to root_path if current_user == @item.user
  end

  def buy_confirmation
    redirect_to root_path if @item.record.present?
  end
end