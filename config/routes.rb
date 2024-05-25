Rails.application.routes.draw do
  get 'guests/:id' => 'guests#show'
end
