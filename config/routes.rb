Rails.application.routes.draw do

  resources :mountains
  resources :home, only: [:index]
  root 'home#index'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
