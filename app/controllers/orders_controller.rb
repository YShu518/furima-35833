class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :to_root_path

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    end
    render 'index'
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :area_id, :city, :address_line1, :address_line2, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def to_root_path
    redirect_to root_path if !@item.order.nil? || @item.user.id == current_user.id
  end
end
