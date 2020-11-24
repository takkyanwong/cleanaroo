class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.save
    # if @property.save
    #   redirect_to new_booking_path
    # else
    #   render :new
    # end
  end


  private

  def property_params
    params.require(:property).permit(:address, :size, :bedroom_count, :bathroom_count, :property_type)
  end
end
