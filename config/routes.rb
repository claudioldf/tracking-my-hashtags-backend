Rails.application.routes.draw do
  resources :hashtags, only: [:index, :create, :destroy]
  resources :messages, only: [:index]
end
