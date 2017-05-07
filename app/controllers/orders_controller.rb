class OrdersController < ApplicationController

  include ChessStoreHelpers::Cart

  before_action :set_order, only: [:toggle, :pay, :update]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.grand_total = @order.shipping_costs + session[:cart_total]

    if @order.save
      save_each_item_in_cart(@order)
      render action: 'pay'
    else
      render action: 'new'
    end
  end

  def pay
  end

  def update
    if @order.update(order_params)
      @order.pay
      clear_cart
      redirect_to home_path, notice: "Successfully placed order"
    else
      render action: 'pay'
    end
  end

  def toggle
    if params[:status] == 'shipped'
      @order.order_items.each do |item|
        item.shipped
      end
    end
    @order.save!
    @orders_to_ship = Order.not_shipped
  end

  private

  def set_order
      @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:date, :school_id, :user_id, :grand_total, :payment_receipt, :credit_card_number, :expiration_year, :expiration_month)
  end

end