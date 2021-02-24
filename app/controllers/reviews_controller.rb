class ReviewsController < ApplicationController
  def index
    @reviews = Review.all if current_user.admin
  end

  def create
    @show = Show.find(params[:show_id])
    @review = Review.new(review_params)
    @review.show = @show
    if @review.save!
      redirect_to show_path(@show)
    else
      render "shows/show"
    end
  end

  def destroy
    Review.destroy(params[:id])
    redirect_to reviews_path, notice: 'Review successfully deleted'
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
