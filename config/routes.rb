Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
