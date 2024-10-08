class CreateBookingTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_treatments do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :treatment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
