Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  get "/contacts" => "contacts#index"
  get "/contacts/new" => "contacts#new"
  get "/contacts/:id" => "contacts#show"
  post "/contacts" => "contacts#create"
  get "/contacts/:id/edit" => "contacts#edit"

  patch "/contacts/:id" => "contacts#update"
  delete "/contacts/:id" => "contacts#destroy"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get '/contacts' => 'contacts#index'  
    post '/contacts' => 'contacts#create'
    get '/contacts/:id' => 'contacts#show'
    patch '/contacts/:id' => 'contacts#update'
    delete '/contacts/:id' => 'contacts#destroy'
    
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
  end
end