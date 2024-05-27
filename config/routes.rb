Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #guests
  get "/guests/:id", to: "guests#show"

  #guest_rooms
  post "/guests/:guest_id/guest_rooms", to: "guest_rooms#create"

  #rooms
  get "/rooms", to: "rooms#index"

  #hotels
  get "/hotels/:id", to: "hotels#show"
end
