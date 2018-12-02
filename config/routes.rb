Rails.application.routes.draw do
  devise_for :users
  root 'goals#index'
  resources :users, shallow: true do
    resources :goals, shallow: true do
      resources :tasks
      resources :comments, except: [:index, :show]
    end
  end
end
