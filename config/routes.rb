Rails.application.routes.draw do
  get 'braintree/new'

	resources :users
  resource :session, only: [:create, :destroy, :new]

  root 'users#show'

  get '/auth/:provider/callback', to: 'sessions#create_from_omniauth'

  delete "/sign_out" => "sessions#destroy", as: "sign_out"
end
