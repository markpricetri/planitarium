class ShowsController < ApplicationController
  def index
    @shows = Show.all
    @shows.each do |show|
      @showings = Showing.where(show_id: show.id)
    end
    @markers = @shows.geocoded.map do |show|
      {
        lat: show.latitude,
        lng: show.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { show: show })
      }
    end
    respond_to do |format|
      format.html
      format.json { render json: { shows: @shows } }
    end
  end

  def show
    @show = Show.find(params[:id])
    @showings = Showing.where(show_id: @show.id)
    @review = Review.new
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    @show.user = current_user
    if @show.save
      redirect_to new_show_showing_path(@show), notice: 'Show successfully created'
    else
      render :new
    end
  end

  private

  def show_params
    params.require(:show).permit(:name, :description, :photo)
  end
end
