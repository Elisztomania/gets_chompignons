Rails.application.routes.draw do
  devise_for :users
  root to: 'mushrooms#index'
    get '/mushrooms/mymushrooms', to: 'mushrooms#show_my', as: 'my_mushrooms'
    get 'mushrooms/favorites', to: 'favorites#show'
    resources :mushrooms, only: [:index, :show, :create, :new, :update, :edit] do
      resources :favorites, only: [:create]
    end

    resources :users, only: [:show]
      # resources :mushrooms, only: [:show, :update, :edit]
       # display favorites and user created

    resources :favorites, only: :destroy
end
