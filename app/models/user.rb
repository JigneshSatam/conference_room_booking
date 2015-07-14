class User < ActiveRecord::Base
	has_many :bookings
	has_many :rooms,	 through: :bookings
	has_many :timeslots, through: :bookings

	validates :name, :email_id, presence: true
	validates :email_id, uniqueness: {message: "Email_id already taken"}
end
