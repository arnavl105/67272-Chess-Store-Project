class OrdersController < ApplicationController

  before_action :set_order

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

end