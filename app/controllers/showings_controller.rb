class ShowingsController < ApplicationController
  def index
    @show = Show.find(params[:show_id])
    @showings = Showing.where(show_id: @show.id)
  end

  def show
    @show = Show.find(params[:show_id])
    @showing = Showing.find(params[:id])
  end

  def new
    @show = Show.find(params[:show_id])
    @showing = Showing.new
  end

  def create
    @showing = Showing.new(showing_params)
    @show = Show.find(params[:show_id])
    @showing.show = @show
    if @showing.save
      redirect_to show_path(@show), notice: 'Showing successfully created'
    else
      render :new
    end
  end

  private

  def showing_params
    params.require(:showing).permit(:start_time, :capacity)
  end
end
