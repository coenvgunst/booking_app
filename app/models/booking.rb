class Booking < ApplicationRecord
  belongs_to :customer
  has_many :booking_treatments, dependent: :destroy
  has_many :treatments, through: :booking_treatments
  has_one :calendar, dependent: :destroy

  validate :must_have_at_least_one_treatment

  private

  # Validates if there is at least one treatment selected
  def must_have_at_least_one_treatment
    if treatments.empty?
      errors.add(:treatments, "must include at least one treatment")
    end
  end
end
