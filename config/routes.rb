Rails.application.routes.draw do
  devise_for :users
  root to: 'mushrooms#index'
    get '/mushrooms/mymushrooms', to: 'mushrooms#show_my', as: 'my_mushrooms'
    resources :mushrooms, only: [:index, :show, :create, :new, :update, :edit] do
      resources :reviews, only: [:create, :new]
    end
    resources :reviews, only: :destroy
end
