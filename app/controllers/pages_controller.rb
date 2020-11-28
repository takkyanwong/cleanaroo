class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @past_bookings = current_user.past_bookings
    @upcoming_bookings = current_user.upcoming_bookings
  end

  def success
    @booking = Booking.find(params[:booking_id])
  end
end
