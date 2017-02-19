class OrderDetailsController < ApplicationController
  def add
      @order = Order.checkOrderStatus
      @food_item = FoodItem.find(params[:id])
      if @food_item.present?
        $order_detail = OrderDetail.new
        $order_detail.food_item_id = params[:id]
        $order_detail.price = @food_item.price
        
        if @order.blank?
          @order = Order.new
          @order.status = 0
          @order.save
        end
        
        $order_detail.order_id =  @order.id
        
        if $order_detail.save
          flash[:notice] = "Add food successful !"
          redirect_to "/orders/#{@order.id.to_s}"
        end
          
      else
        flash[:notice] = "Not found this food !"
        redirect_to root_path
      end
  end
  
  def delete
    @orderDetail = OrderDetail.find(params[:id])
    @orderId = @orderDetail.order.id
    @orderDetail.destroy
    flash[:notice] = "remove food successful !"
    redirect_to "/orders/#{@orderId.to_s}"
  end
  
end
