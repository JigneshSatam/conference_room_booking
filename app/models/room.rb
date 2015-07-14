class Room < ActiveRecord::Base
	has_many :bookings
	has_many :timeslots, through: :bookings
	has_many :users, 		 through: :bookings
end
