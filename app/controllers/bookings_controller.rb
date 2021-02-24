class BookingsController < ApplicationController
  # Index action, where if current_user is admin, they can view ALL bookings for a show...
  # where-as a non-admin user can only see the booking(s) they have made for a show
  def index
    @my_bookings = Booking.where(user_id: current_user.id)

    @bookings = Booking.all if current_user.admin
  end

  # Show action to display details for an individual show.
  def show
    @booking = Booking.find(params[:id])
  end

  # New booking so that simple_form can create a form
  def new
    @booking = Booking.new
    @show = Show.find(params[:show_id])
  end

  # Create action to create a booking (from POST request)
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.show = Show.find(params[:show_id])
    if @booking.save
      # redirects to the user's booking page for that booking if successful
      redirect_to user_booking_path(@booking.user, @booking.id), notice: 'Booking Successful!'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:no_of_people)
  end
end
