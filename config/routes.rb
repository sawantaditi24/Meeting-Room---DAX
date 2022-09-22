Rails.application.routes.draw do
  # get 'demo_controller/index'
   #get 'demo/index'
  # get 'demo/hello'
  # get 'reservations/show'
  # devise_for :users
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'static_pages#root'
  # resources :users do
  #   resources :reservations
  # end

   resources :bookings
  resources :locations do 
    resources :bookings, only: [:index, :show, :new]
  end
  resources :clients do 
    resources :bookings, only: [:index, :show, :new]
  end
  devise_for :users #, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  get 'welcome/home'
  root 'welcome#home'
  
  get '/about', to: 'welcome#about'
  
  get '/locations/:id/client_list', to: 'locations#client_list', as: 'client_list'

  
end
