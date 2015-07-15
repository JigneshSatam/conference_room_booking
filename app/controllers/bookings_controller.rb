class BookingsController < ApplicationController
  def new
    @booking  = Booking.new
    @room     = Room.where(room_number: params[:room_number]).first
    @bookings = @room.bookings
      .joins(:timeslot)
      .where(timeslots: {booking_date: Date.today})
      .order("timeslots.start_time")
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
      booking  = Booking.create(user: user, timeslot: timeslot, room: room)
      flash[:notice] = "Room Booked"
      redirect_to rooms_path
    else
      flash[:notice] = "Sorry! Please select proper time slot to book the room"
      redirect_to new_booking_path(room_number: "#{room.room_number}")
    end
  end

  def update
  end

  def delete
  end

  private
    def check_availability(room, timeslot)
      (timeslot.start_time > timeslot.end_time) && (return false)
      timeslots = Timeslot.where(booking_date: timeslot.booking_date)
        .where("(start_time >= :start_time AND start_time < :end_time) OR
          (end_time > :start_time AND end_time <= :end_time) OR
          (start_time <= :start_time AND end_time >= :end_time)",
          { start_time: timeslot.start_time,
          end_time: timeslot.end_time })
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
