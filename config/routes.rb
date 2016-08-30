Rails.application.routes.draw do
  root to: 'home#index'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  get '/auth/failure', to: 'home#auth_failure'

  get '/dashboard', to: 'dashboard#show'
  delete '/logout', to: 'sessions#destroy', as: :logout
end
