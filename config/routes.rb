Rails.application.routes.draw do
  resources :hashtags
  resources :messages, only: [:index]
end
