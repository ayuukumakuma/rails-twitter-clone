Rails.application.routes.draw do
  devise_for :users
  # rootにアクセスして，ログインしていない場合はログイン画面にリダイレクト. ログインしているときはhomeにリダイレクト
  root to: redirect('/home')
  get 'home', to: 'tweets#index'
  get 'post', to: 'tweets#new'
  get 'search', to: 'commons#search'
  get '/:name', to: 'profiles#show'

  post '/follow/:user_id', to: 'relationships#create', as: 'follow'
  delete '/unfollow/:user_id', to: 'relationships#destroy', as: 'unfollow'

  # ブラウザからはアクセスできないresources: tweets
  resources :tweets, inactive: true
end
