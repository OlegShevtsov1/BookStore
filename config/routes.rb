Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login',
                                   sign_out: 'logout',
                                   password: 'secret',
                                   sign_up: 'registration' },
                     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'homes#index'
  resources :homes, only: [:index]
  resources :books, only: [:index]
  resources :categories, only: [] do
    resources :books, only: %i[index show] do
      put :calc_price, on: :member
    end
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
