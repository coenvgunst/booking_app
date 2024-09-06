class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :customer, null: false, foreign_key: true
      t.date :date
      t.time :time
      t.string :status

      t.timestamps
    end
  end
end
