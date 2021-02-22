class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def show
    @show = Show.find(params[:id])
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      redirect_to show_path(@show), notice: 'Show successfully created'
    else
      render :new
    end
  end

  private

  def show_params
    params.require(:show).permit(:name, :start_time, :capacity)
  end
end
