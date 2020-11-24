class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
    @booking = Booking.new
    @property = Property.find(params[:property_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.where(role:1).sample # TODO: assign cleaner based on availability and location
    @booking.user = @user 
    @property = Property.find(params[:property_id])
    @booking.property = @property 
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :cost, :comment)
  end

  # def property_params
  #   params.require(:property).permit(:booking_id)
  # end
end
