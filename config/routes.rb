Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root "home#index"

  resources :patient_registration, only: %i[new create]

  namespace :patient do
    resources :profiles, only: %i[index update]
    resources :doctors, only: %i[index]
  end
end
