Rails.application.routes.draw do
  # clearance starts here
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/users/:id" => "users#show"

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # clearance ends here

	root 'users#index'
  resources :users
	# get '/users/new' => 'users#new'
	# # resources :users

	# get '/login' => 'sessions#new'
	# post '/login' => 'sessions#create'
	# delete '/logout' => 'sessions#destroy'

	resources :listings
    get "listings/:id/new_booking" => "listings#new_booking", as: "new_booking"
    post "listings/:id/book" => "listings#book", as: "book"
	resources :reservations  

  get "/listings/:id/addtag" => "listings#add_tag", as: "addtag"
  post "/listings/:id/addingtag" => "listings#adding_tag", as: "addingtag"

  get "/listings/search" => "listings#search", :action => 'search', as: "search"


	get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
