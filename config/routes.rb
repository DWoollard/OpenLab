Rails.application.routes.draw do
  root 'sessions#home'

  post '/payments' => 'payments#create'
  post '/pools' => 'pools#create'

  resource :sessions
  resource :users
  resource :stripe_accounts
  resource :addressess

  resources :videos, except: [:show, :index]
  resources :projects, shallow: true do
    resources :categories_projects
    resources :images
    resources :logs
    resources :contents
    resources :categories
  end

end
