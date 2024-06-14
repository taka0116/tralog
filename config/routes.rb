Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  root 'posts#index'

  # get '/users/:id', to: 'users#show', as: 'user'
  resources :users, only: %i(show index)

  resources :posts, only: %i(new create index destroy edit update) do
    resources :photos, only: %i(create)
    resources :comments, only: %i(create destroy)
  end

end
