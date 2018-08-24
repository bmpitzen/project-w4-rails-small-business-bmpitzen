Rails.application.routes.draw do

  root "products#home"
  resources :products, only: [:index, :show] do 
    get :home
  end

end
