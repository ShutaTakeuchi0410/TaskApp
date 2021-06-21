Rails.application.routes.draw do
  devise_for :users

  get 'home', to: 'home#index'
  get 'home/inbox', to: 'home#inbox'
  get 'home/future', to: 'home#future'
  get 'home/done', to: 'home#done'
  post 'home/toggle/:id', to: 'home#toggle'
  resources :tasks, except: [:index] do
    resources :comments, only: [:create, :destroy]
  end
  resources :projects, only: [:new, :create, :show, :destroy]
  resources :tags, only: [:new, :create, :show, :destroy]

  # 検索
  get 'search', to: 'searches#index'
  get 'search/result', to: 'searches#search'

  root to: 'home#index'
end
