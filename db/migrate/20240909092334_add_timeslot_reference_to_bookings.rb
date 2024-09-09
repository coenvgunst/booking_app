class AddTimeslotReferenceToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :timeslot, foreign_key: true
  end
end
