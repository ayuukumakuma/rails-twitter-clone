Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#title'
  get 'profile', to: 'profiles#index'
  get 'timeline', to: 'tweets#index'
  get 'post', to: 'tweets#new'
  get 'edit', to: 'tweets#edit'
  # 外部からはこのパスは使えない
  resources :tweets, inactive: true
end
