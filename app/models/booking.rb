class Booking < ApplicationRecord
  belongs_to :customer
  has_many :booking_treatments, dependent: :destroy
  has_many :treatments, through: :booking_treatments
  has_one :calendar, dependent: :destroy
end
