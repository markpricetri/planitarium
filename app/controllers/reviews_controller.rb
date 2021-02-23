class ReviewsController < ApplicationController
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

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
