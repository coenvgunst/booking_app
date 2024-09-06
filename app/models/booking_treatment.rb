class BookingTreatment < ApplicationRecord
  belongs_to :booking
  belongs_to :treatment
end
