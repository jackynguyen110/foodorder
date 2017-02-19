class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to    :food_item
  
  def self.timeorder(id)
    list = self.where(food_item_id:id)
    return list.count
  end
  
end
