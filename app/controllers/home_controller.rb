class HomeController < ApplicationController
  def index
    Section.generate_default
    @sections = Section.all
   
    if params[:sort_column].present? == false
      sort_column = ""
    else 
      sort_column = params[:sort_column]
    end
    if params[:sort_derection].present? == false
      sort_derection = ""
    else
      sort_derection = params[:sort_derection] 
    end
    
    if params[:name].present? == false
      name = ""
    else
      name = params[:name] 
    end
    
    
    if params[:section_id].present?
      @current_section = Section.find(params[:section_id])
      @listFoods = @current_section.food_items
      
  
      if sort_column != "" && sort_derection != ""
          @listFoods = FoodItem.where('section_id = ?', params[:section_id]).order("#{sort_column} #{sort_derection}")
      end
    else 
       #abort(name)
       @listFoods = FoodItem.all
       
       if sort_column != "" && sort_derection != ""
            @listFoods = FoodItem.all.order("#{sort_column} #{sort_derection}")
       end
       
       if name != ""
          @listFoods = FoodItem.where("name ILIKE ?", "%#{name}%")
          #abort("%#{name}%")
       end
    end
    
  end

end
