class Booking < ActiveRecord::Base
  belongs_to :room
  belongs_to :timeslot
  belongs_to :user
  accepts_nested_attributes_for :room, :user, :timeslot
end
