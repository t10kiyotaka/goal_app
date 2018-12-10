Rails.application.routes.draw do
  devise_for :users
  root 'goals#index'
  get 'mypage', to: 'loggedin_users#show'
  get 'mygoals/:id', to: 'loggedin_user_goals#show', as: 'mygoal'
  resources :users, shallow: true do
    resources :goals, shallow: true do
      resources :tasks
      resources :comments, except: [:index, :show]
    end
  end
end
