class Timeslot < ActiveRecord::Base
	has_many :bookings
	has_many :rooms, through: :bookings
	has_many :users, through: :bookings
end
