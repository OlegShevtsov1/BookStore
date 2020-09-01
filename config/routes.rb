Rails.application.routes.draw do
  root to: 'home#home'
  resources :books, only: [:index]
end
