Rails.application.routes.draw do

  resources :leases, only: [:create, :destroy]

  resources :tenants, only: [:create, :update, :index, :destroy]

  resources :apartments, only: [:create, :update, :index, :destroy]

end
