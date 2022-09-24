Rails.application.routes.draw do
  # get '/articles', to: 'articles#index'
  # get '/articles/:id', to: 'articles#show'
  resources :articles, only: [:index, :show]
end
