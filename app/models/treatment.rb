class Treatment < ApplicationRecord
    has_many :booking_treatments, dependent: :destroy
    has_many :bookings, through: :booking_treatments
  end
  