class CreateCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :calendars do |t|
      t.references :booking, null: false, foreign_key: true
      t.string :google_calendar_event_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
