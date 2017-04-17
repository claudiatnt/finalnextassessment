Rails.application.routes.draw do
	resources :users, except: [:index]
  resource :session, only: [:create, :destroy, :new]

  root 'users#show'

  get '/auth/:provider/callback', to: 'sessions#create_from_omniauth'
end
