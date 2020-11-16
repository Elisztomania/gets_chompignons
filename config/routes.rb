Rails.application.routes.draw do
  devise_for :users
  root to: 'mushrooms#index'
    resources :mushrooms, only: [:index, :show, :create, :new, :update, :edit]
end
