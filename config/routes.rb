Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/print_contacts_url" => "contacts#print_contacts_action"
    get "/all_contacts_url" => "contacts#all_contacts_action"
  end
end
