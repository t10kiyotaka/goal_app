Rails.application.routes.draw do
  devise_for :users
  root 'goals#index'
  resources :users, only: [:index, :show], shallow: true do
    resources :goals, except: [:new], shallow: true do
      resources :comments, except: [:index, :show, :new]
    end
  end

  resource :me, controller: 'me', only: %i[show]
  namespace :my do
    resources :goals, except: %i[new], shallow: true do
      resources :tasks, except: %i[index show new]
    end
  end
end
