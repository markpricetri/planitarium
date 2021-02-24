class ShowsController < ApplicationController
  def index
    @shows = Show.all

    @markers = @shows.geocoded.map do |show|
      {
        lat: show.latitude,
        lng: show.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { show: show })
      }
    end
  end

  def show
    @show = Show.find(params[:id])
    @review = Review.new
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    @show.user = current_user
    if @show.save
      redirect_to show_path(@show), notice: 'Show successfully created'
    else
      render :new
    end
  end

  private

  def show_params
    params.require(:show).permit(:name, :start_time, :capacity, :photo)
  end
end
