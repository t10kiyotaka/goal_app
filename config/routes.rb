Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  resources :users do
    resources :goals
  end
end
