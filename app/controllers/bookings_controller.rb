class BookingsController < ApplicationController
  # Index action, where if current_user is admin, they can view ALL bookings for a show...
  def index
    @bookings = Booking.all if current_user.admin
  end

  # New booking so that simple_form can create a form
  def new
    @booking = Booking.new
    @showing = Showing.find(params[:showing_id])
  end

  # Create action to create a booking (from POST request)
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @showing = Showing.find(params[:showing_id])
    @booking.showing = @showing
    if @booking.save
      # redirects to the user's booking page for that booking if successful
      redirect_to user_path(current_user), notice: 'Booking Successful!'
    else
      redirect_to new_user_session_path, notice: "Please log in or sign up to book!"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:no_of_people)
  end
end
