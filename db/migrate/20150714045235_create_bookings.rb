class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.belongs_to :rooms, index: true
      t.belongs_to :timeslots, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
