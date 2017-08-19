Rails.application.routes.draw do
  devise_for :users
  resources :spans
  resources :interventions
  resources :communicatables
  resources :extents
  resources :regions
  resources :genders
  resources :advisers do
    resources :rates
  end
  resources :messages
  resources :reservations

  get 'eval/new'
  get 'chat/show'
  get 'search/new'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
