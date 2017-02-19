Rails.application.routes.draw do
  resources :food_items
  resources :reviews


  root 'home#index'
  
  get 'home/about'
  
  get 'order_details/add/:id' => "order_details#add"
  get 'orders/:id' => "orders#show"
  get 'orders/show'
  
  get 'order_details/delete/:id' => "order_details#delete"
  get 'orders/update/:id' => "orders#update"
  get 'orders/information/:id' => "orders#information"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
