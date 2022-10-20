Rails.application.routes.draw do

  resources :home, only: [:index]
  root 'home#index'
  post '/home/guest_sign_in', to: 'home#guest_sign_in'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
