class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    @booking = Booking.new
    @property = Property.find(params[:property_id])

    @step_two = true
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.state = 'pending'
    @user = User.where(role: 1).sample # TODO: assign cleaner based on availability and location
    @booking.user = @user
    @property = Property.find(params[:property_id])
    @booking.property = @property

    if @booking.save
      redirect_to new_booking_booking_task_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    # /bookings/:id(.:format)
    @markers = [{
      lat: @booking.property.latitude,
      lng: @booking.property.longitude
    }]
  end


  private

  def booking_params
    params.require(:booking).permit(:date, :cost, :comment)
  end
end
