Rails.application.routes.draw do
  devise_for :users
  resources :products do
    member do
      get :bid
      get :bidding
      put :claim
    end
    collection do
      get :my_products
      get :mybids
      get :claimeditems
      get :my_sold_products
      get :otherclaims
    end
  end
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
