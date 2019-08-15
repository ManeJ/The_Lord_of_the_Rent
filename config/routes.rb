Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :warriors do
    resources :bookings
  end
  get 'owner/bookings', to: 'bookings#display_resa'
  patch 'owner/bookings/:id', to: 'bookings#accept'
  get 'owner/warriors', to: 'warriors#owner'
  get 'owner/bookings/warriors', to: 'bookings#display_bookings', as: :bookings_warriors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
