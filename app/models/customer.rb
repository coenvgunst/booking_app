class Customer < ApplicationRecord
    has_many :bookings, dependent: :destroy
  end
  