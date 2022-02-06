class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    get_item
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create
    get_item
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :block_number, :house_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def get_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
