Rails.application.routes.draw do
	root 'users#index'
	get '/users/new' => 'users#new'
	resources :users

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#destroy'

	resources :listings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
