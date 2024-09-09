Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'

  resources :calendars
  resources :booking_treatments
  resources :bookings
  resources :treatments
  resources :customers
end
