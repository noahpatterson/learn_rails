require 'sidekiq/web'

LearnRails::Application.routes.draw do 
  # post 'contact', to: 'contacts#process_form'
  resources :contacts, only: [:new, :create]
  root to: 'visitors#new'
  # mount Sidekiq::Web, at: '/sidekiq'
end