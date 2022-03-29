# frozen_string_literal: true

Rails.application.routes.draw do
  get 'realtors/index'
  resources :posts
  resources :properties
  resources :listhouses
  resources :housesrent
  resources :careers
  resources :realtors
  devise_for :accounts

  get 'blog' => 'posts#latest', as: :blog

  # admin routes
  get '/accounts' => 'admin#accounts', as: :accounts

  get '/dashboard' => 'dashboard#index', as: :dashboard
  get '/profile/:id' => 'dashboard#profile', as: :profile
  post '/agent/message' => 'properties#email_agent', as: :email_agent

  root to: 'public#main'

  scope '/checkout' do
    get 'create/:id', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
end
