# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'search/index'
  get 'home/index'
  get '/search', to: 'movies#search', as: 'search'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :theatreshows
  resources :moviestheatres
  resources :details
  resources :movies
  resources :theatres
  root 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
