class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.belongs_to :room, index: true
      t.belongs_to :timeslot, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
