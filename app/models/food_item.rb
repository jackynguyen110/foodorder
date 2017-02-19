class FoodItem < ApplicationRecord
  belongs_to :section
  has_many   :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: {case_sentitive: false}
   #validates price, presence: true
   
end
