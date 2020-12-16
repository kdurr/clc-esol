Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :admins, only: [:index]

  resources :courses, only: [:index, :show, :new, :create, :update]

  resources :assignments, only: [:show, :new, :create, :update] do
    resources :assignment_sections, only: [:create]
  end
  
  get '/create_class', to: 'courses#new'
  get '/create_assignment', to: 'assignments#new'
  # post '/create_class', to: 'courses#new'

  root to: "courses#index"
end
