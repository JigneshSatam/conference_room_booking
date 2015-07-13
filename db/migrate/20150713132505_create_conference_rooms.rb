class CreateConferenceRooms < ActiveRecord::Migration
  def change
    create_table :conference_rooms do |t|
      t.integer :room_number
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
