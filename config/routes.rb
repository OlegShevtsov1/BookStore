Rails.application.routes.draw do
  root 'homes#index'
  resources :homes, only: [:index]
  resources :books, only: [:index]
  resources :categories, only: [] do
    resources :books, only: %i[index show] do
      put :calc_price, on: :member
    end
  end
end
