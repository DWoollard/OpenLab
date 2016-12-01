Rails.application.routes.draw do
  root 'sessions#home'
  resources :projects

  resources :logs
  resource :sessions
  resource :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
