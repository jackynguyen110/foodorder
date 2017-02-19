class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @sum = @order.sumOrder(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.status = 1
    if @order.update(order_params)
      flash[:notice] = "Order sucessful, your order will be delivery in 1 hour !"
      redirect_to "/orders/information/#{params[:id].to_s}"
    else
      flash[:notice] = "Please fill all your information"
      redirect_to "/orders/#{param[:id].to_s}"
    end
  end
  
  def information
    @order = Order.find(params[:id])
    @sum = @order.sumOrder(params[:id])
    
  end
  
  private
  def order_params
    params.require(:order).permit(:name, :address, :phone, :email, :coupon)
  end
 
end
