Rails.application.routes.draw do
  devise_for :users
  root to: 'mushrooms#index'
    get '/mushrooms/mymushrooms', to: 'mushrooms#show_my', as: 'my_mushrooms'
    get 'mushrooms/favorites', to: 'favorites#show'
    resources :mushrooms, only: [:index, :show, :create, :new, :update, :edit] do
      resources :reviews, only: [:create, :new]
      resources :favorites, only: [:create]
    end
  
    resources :favorites, only: :destroy
    resources :reviews, only: :destroy
end
