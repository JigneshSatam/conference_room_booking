class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def index
    @bookings = Booking.all
  end

  def edit
  end

  def show
  end

  def create
    user     = User.where(user_params).first
    timeslot = Timeslot.new(timeslot_params)
    room     = Room.where(room_params).first
    if check_availability(room, timeslot) && timeslot.save
      debugger
      booking  = Booking.create(user: user, timeslot_id: timeslot.id, room: room)
      flash[:notice] = "Room Booked"
    end
    redirect_to rooms_path
  end

  def update
  end

  def delete
  end

  private
    def booking_params
      # params.require(:booking).permit(:name)
      # params.require(:booking).require(:users).premit(:name)
    end

    def check_availability(room, timeslot)
      (timeslot.start_time > timeslot.end_time) && (return false)
      timeslots = Timeslot.where("booking_date == (?) AND 
        (start_time BETWEEN (?) AND (?) OR end_time BETWEEN (?) AND (?))",
        timeslot.booking_date, 
        timeslot.start_time, timeslot.end_time, 
        timeslot.start_time, timeslot.end_time)
      debugger
      timeslots.blank?
    end

    def room_params
      params.require(:booking).require(:rooms).permit(:room_number)
    end

    def timeslot_params
      params.require(:booking).require(:timeslots).permit(:booking_date, :start_time, :end_time)
    end

    def user_params
      params[:booking].require(:users).permit(:email_id)
    end
end
