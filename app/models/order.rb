class Order < ApplicationRecord
  has_many   :order_details, dependent: :destroy
  
  def self.checkOrderStatus
    @order = self.where(status:0)
    
    if @order.blank?
      return false
    else
      return @order.first
    end
  end
  
  def sumOrder(id)
    @order = Order.find(id)
    @orderDetail = @order.order_details
    sum = 0
    @orderDetail.each do |od|
      sum = sum + od.price.to_f
    end
    return sum
  end
end
