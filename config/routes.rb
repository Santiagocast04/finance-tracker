Rails.application.routes.draw do
  resources :user_stocks, only: [:destroy, :create]
  devise_for :users
  root  'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'my_friends', to: 'users#friends'
  get 'search_friends', to: 'users#search'
  resources :friendships, only: [:destroy, :create]

end
