Rails.application.routes.draw do
	resources :users, except: [:index]
  resource :session, only: [:create, :destroy, :new]

  root 'users#show'
end
