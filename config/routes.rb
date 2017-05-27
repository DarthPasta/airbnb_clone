Rails.application.routes.draw do
	root 'users#index'
	get '/users/new' => 'users#new'
	resources :users

	get '/sessions/new' => 'sessions#new'
	post '/sessions/create' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
