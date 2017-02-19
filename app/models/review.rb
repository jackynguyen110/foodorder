class Review < ApplicationRecord
  belongs_to :food_item
   validates :title, presence: true, uniqueness: {case_sentitive: false}
   validates :content, presence: true, uniqueness: {case_sentitive: false}
   
   
  def self.averageRating(id)
    list = self.where(food_item_id:id)
    sum = 0
    list.each do |r|
      sum += r.rating.to_i
    end
    if (list.count > 0)
      return sum/list.count
    else
      return 0
    end
  end
end
