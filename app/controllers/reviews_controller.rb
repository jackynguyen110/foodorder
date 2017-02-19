class ReviewsController < ApplicationController
  def new
     #abort("Message goes here")
     
     @review = Review.new(review_params)
     if @review.save
        flash[:notice] = "Thanks for review"
     else
       flash[:notice] = "Can Not Save"
     end
     redirect_to "/food_items/"+ @review.food_item_id.to_s
     #redirect_to controller: "food_items", action: "show", id: params[:food_id]
  end
  
    
  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :food_item_id)
  end
end
