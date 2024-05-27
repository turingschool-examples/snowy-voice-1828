Rails.application.routes.draw do
  get '/guests/:id' => 'guests#show'
  post '/guest_rooms/:id' => 'guest_rooms#create'
end
