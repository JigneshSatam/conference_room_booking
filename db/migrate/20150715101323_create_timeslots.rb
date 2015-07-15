class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.date :booking_date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
