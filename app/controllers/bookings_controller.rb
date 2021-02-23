class BookingsController < ApplicationController
  # Index action, where if current_user is admin, they can view ALL bookings for a show...
  # where-as a non-admin user can only see the booking(s) they have made for a show
  def index
    unless current_user.admin
      @bookings = Booking.where(user_id: current_user.id)
    else
      @bookings = Booking.all
    end
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
    attrs = { no_of_people: booking_params, show_id: params[:show_id], user_id: current_user.id }
    @booking = Booking.new(attrs)
    if @booking.save
      # redirects to the user's booking page for that booking if successful
      redirect_to user_booking_path(@user, @booking), notice: 'Booking Successful!'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:no_of_people)
  end
end
