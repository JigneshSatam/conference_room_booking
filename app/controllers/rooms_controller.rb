class RoomsController < ApplicationController
	def index
		@rooms = Room.all
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new(room_params)
		if @room.save
			flash[:notice] = "Created new room"
		end
		redirect_to rooms_path
	end

	private
		def room_params
			params.require(:room).permit(:room_number)
		end
end
