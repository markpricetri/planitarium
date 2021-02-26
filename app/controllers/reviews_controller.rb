class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @results = Review.search_by_content(params[:query])
  end

  def create
    @show = Show.find(params[:show_id])
    @review = Review.new(review_params)
    @review.show = @show
    if @review.save!
      redirect_to show_path(@show, anchor: "reviews")
    else
      render "shows/show"
    end
  end

  def destroy
    if Review.destroy(params[:id])
      redirect_to reviews_path, success: 'Review successfully deleted'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
