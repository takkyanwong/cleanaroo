class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
   end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to dashboard_path(review: 1) # this will add in URL /dashboard?review=1 > use for JS to use the anchor to past bookings
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
end
