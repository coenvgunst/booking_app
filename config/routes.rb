Rails.application.routes.draw do
  get 'timeslots/index'
  get 'timeslots/show'
  get 'timeslots/new'
  get 'timeslots/edit'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'

  resources :timeslots
  resources :booking_treatments
  resources :bookings
  resources :treatments
  resources :customers
end
