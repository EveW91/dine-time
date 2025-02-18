Rails.application.routes.draw do
  devise_for :users
  root "restaurants#index"

  resources :restaurants do
    resources :reservations, only: [ :new, :create, :index, :show, :edit, :update, :destroy ]
    resources :reviews, only: [ :new, :create, :index, :show, :edit, :update, :destroy ]
  end
end
