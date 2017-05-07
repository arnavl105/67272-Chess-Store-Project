class HomeController < ApplicationController
  def home
    @items_to_reorder = Item.need_reorder.alphabetical.to_a
  	
    @orders_to_ship = Order.not_shipped
    
    @pending_orders = Order.not_shipped.where(user: current_user)
    @previous_orders = Order.chronological.where(user: current_user)
    
    @employee_list = User.active.where(role: "shipper").alphabetical

    @top_items = Item.active.joins(:order_items).group("item_id").order("count(item_id) DESC").limit(10)
    
    @total_revenue = Order.where('payment_receipt IS NOT NULL').sum("grand_total")
    @number_of_orders = Order.count()
    @number_of_customers = User.where(role: "customer").count()
  end

  def about
  end

  def contact
  end

  def privacy
  end
  
end