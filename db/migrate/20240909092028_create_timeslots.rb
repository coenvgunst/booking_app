class CreateTimeslots < ActiveRecord::Migration[7.0]
  def change
    drop_table :calendars do |t|
      t.timestamps
    end


    create_table :timeslots do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :available, default: true
      
      t.timestamps
    end
  end
end
