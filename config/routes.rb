Rails.application.routes.draw do
  devise_for :users

  get 'home', to: 'home#index'
  get 'home/inbox', to: 'home#inbox'
  get 'home/future', to: 'home#future'

  resources :tasks, except: [:index] do
    resources :comments, only: [:create, :destroy]
  end
  resources :projects, only: [:new, :create, :show, :destroy]
  resources :tags, only: [:new, :create, :show, :destroy]
end
