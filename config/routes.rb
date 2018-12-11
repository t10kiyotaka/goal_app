Rails.application.routes.draw do
  devise_for :users
  root 'goals#index'
  get 'mypage', to: 'loggedin_users#show'
  get 'mygoals/:id', to: 'loggedin_user_goals#show', as: 'mygoal'
  resources :users, only: [:index, :show], shallow: true do
    resources :goals, except: [:new], shallow: true do
      resources :tasks, except: [:index, :show, :new]
      resources :comments, except: [:index, :show, :new]
    end
  end
  resource :me, controller: 'me', only: %i[show] do
    resources :goals, controller: 'me_goals', only: %i[show]
  end
end
