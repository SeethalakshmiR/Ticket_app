# frozen_string_literal: true

Rails.application.routes.draw do
  get 'details/new'
  get 'confirmations/index'
  get 'movies/index'
  get 'theatres/index'
  get 'theatreshows/index'
  resources :moviestheatres
  resources :details
  root 'movies#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
