Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get 'auth/google_oath/callback', to: 'sessions#GoogleAuth'
  get 'auth/failure', to: redirect('/')


  resources :reviews
  resources :genres

  resources :books do 
    resources :reviews, only: [:new, :index, :edit]
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
