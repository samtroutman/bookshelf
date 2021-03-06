Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get 'auth/google_oauth2/callback', to: 'sessions#omniauth'

  get '/books/highest_ranked' => 'books#highest_ranked'


  resources :reviews, except: :index
  resources :genres

  resources :books do 
    resources :reviews, only: [:new, :show] 
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
