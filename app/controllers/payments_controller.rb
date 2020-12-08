class PaymentsController < ApplicationController
  def new
    @booking = Booking.where(state: 'pending').find(params[:booking_id])
  end
end
