Rails.application.routes.draw do
  get '/cart' => 'cart#index', as: :cart
  get 'cart/clear' => 'cart#clearCart'
  post '/cart/:product_id' => 'cart#add_item', as: :add_item

  root to: 'products#index'
  devise_for :users
  resources :reviews
  resources :products
  
  # #this is to authorize before allowing acess to home page.
  # authenticated :user do
  #   root to: 'products#index', as: :authenticated_root
  # end
  # root to: redirect('/users/sign_up')
end
