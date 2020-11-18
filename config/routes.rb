Rails.application.routes.draw do
  devise_for :users
  root to: 'mushrooms#index'
    get '/mushrooms/mymushrooms', to: 'mushrooms#show_my', as: 'my_mushrooms'
    # get '/favorites', to: 'favorites#show'
    resources :mushrooms, only: [:index, :show, :create, :new, :update, :edit]

    resources :users, only: [:show] do
      resources :favorites, only: [:create]
      # resources :mushrooms, only: [:show, :update, :edit]
    end # display favorites and user created

    resources :favorites, only: :destroy
end
