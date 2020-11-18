Rails.application.routes.draw do
  devise_for :users
  root to: 'mushrooms#index'
    get '/mushrooms/mymushrooms', to: 'mushrooms#show_my', as: 'my_mushrooms'
    get '/favorites', to: 'favorites#show'
    resources :mushrooms, only: [:index, :show, :create, :new, :update, :edit] do
      resources :favorites, only: [:create, :new]
    end
    resources :favorites; only: :destroy
end
