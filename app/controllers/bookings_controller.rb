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
    user = User.new(user_params)
    booking = Booking.create(user: user)
    flash[:notice] = "Room Booked"
    redirect_to Booking.all
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

    def user_params
      params[:booking].require(:users).permit(:name)
    end
end
