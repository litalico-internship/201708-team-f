Rails.application.routes.draw do
  get 'reservation/new'

  devise_for :users
  resources :spans
  resources :interventions
  resources :communicatables
  resources :extents
  resources :regions
  resources :genders
  resources :advisers do
    resources :rates
    get :chat, controller: :chat, action: :show
    get :reservation, controller: :reservation, action: :new
    post :reservation, controller: :reservation, action: :create
  end
  resources :messages
  resources :reservations
  resources :schedules, only: %w[new create]

  get 'eval/new'
  get 'chat/show'
  get 'search/new'
  post 'search/search_result'
  get 'reservation/index'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
