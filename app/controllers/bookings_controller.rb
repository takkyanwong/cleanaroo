class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @booking = Booking.new
    @property = Property.find(params[:property_id])

    @step_two = true
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.where(role:1).sample # TODO: assign cleaner based on availability and location
    @booking.user = @user 
    @property = Property.find(params[:property_id])
    @booking.property = @property 

    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end 

  private

  def booking_params
    params.require(:booking).permit(:date, :cost, :comment)
  end
end
