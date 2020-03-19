# frozen_string_literal: true

Rails.application.routes.draw do
  get 'cancellation/new'
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  get 'home/index'
  get '/search', to: 'movies#search', as: 'search'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :theatreshows
  resources :moviestheatres
  resources :details
  resources :movies
  resources :theatres
  root 'home#index'
  resources :cancellations

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
