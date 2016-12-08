Rails.application.routes.draw do
  get 'images/create'

  root 'sessions#home'

  post '/payments' => 'payments#create'
  post '/pools' => 'pools#create'
  post '/images' => 'images#create'


  resources :videos, except: [:index, :show]
  resources :logs, except: [:index, :show]
  resources :contents, except: [:index, :show]
  resources :categories, except: [:index, :show]
  resource :sessions
  resource :users

  resources :projects do
    resources :categories_projects, shallow: true
  end

end
