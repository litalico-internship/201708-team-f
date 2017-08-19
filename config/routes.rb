Rails.application.routes.draw do
  get 'reservation/new'

  devise_for :users
  resources :rates
  resources :spans
  resources :interventions
  resources :communicatables
  resources :extents
  resources :regions
  resources :genders
  resources :advisers
  resources :messages
  resources :reservations

  get 'eval/new'
  get 'chat/show'
  get 'search/new'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
