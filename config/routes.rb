Rails.application.routes.draw do
  get '/cart' => 'cart#index'
  get 'cart/clear' => 'cart#clearCart'
  get '/cart/:id' => 'cart#add'

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
