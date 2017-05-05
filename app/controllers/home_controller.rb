class HomeController < ApplicationController
  def home
    @items_to_reorder = Item.need_reorder.alphabetical.to_a
  	@orders_to_ship = Order.not_shipped
    @pending_orders = Order.not_shipped.where(user: current_user)
    @previous_orders = Order.chronological.where(user: current_user)
    @employee_list = User.active.where(role: "shipper").alphabetical
  end

  def about
  end

  def contact
  end

  def privacy
  end
  
end