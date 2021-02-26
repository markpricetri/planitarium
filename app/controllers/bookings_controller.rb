class BookingsController < ApplicationController
  # Index action, where if current_user is admin, they can view ALL bookings for a show...
  def index
    if params[:query].present?
      @results = Booking.search_by_id(params[:query])
    else
      @results = Booking.all
    end
  end

  def show
    @booking = Booking.find(params[:id])
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
      redirect_to user_path(current_user), success: 'Booking Successful!'
    else
      redirect_to new_user_session_path, alert: "Please log in or sign up to book!"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @showings = Showing.where(show_id: @booking.showing.show_id)
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path, success: 'Booking amended successfully'
    else
      render :edit
    end
  end

  def destroy
    if Booking.destroy(params[:id])
      redirect_to bookings_path, success: 'Booking successfully deleted'
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:booking_id])
    @showing = @booking.showing
    @show = @showing.show
    @shows = Show.all
  end

  private

  def booking_params
    params.require(:booking).permit(:no_of_people, :showing_id)
  end
end
