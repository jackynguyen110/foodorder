class Section < ApplicationRecord
  has_many :food_items, dependent: :destroy
  
  validates :name, presence: true, uniqueness: {case_sentitive: false}
  
  def self.generate_default
    %w(Breakfast Lunch Dinner Drinks).each do |name|
      Section.find_or_create_by(name: name)
    end
  end
    
end

