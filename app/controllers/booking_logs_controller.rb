class BookingLogsController < ApplicationController
  before_action :set_booking, only: [:checkin, :checkout]

  def checkin
    @booking_log = BookingLog.new
    @booking_log.booking = @booking
    @booking_log.checkin_date_time = DateTime.now
    @booking_log.save

    # TODO: interpolate property manager mobile number
    @twilio_client.messages.create(
      body: "Your cleaner, #{@booking.user.name}, has just checked-in at #{@booking.property.address}",
      from: 'whatsapp:+14155238886',
      to: 'whatsapp:+34634517948'
    )
  end

  def checkout
    @booking_log = @booking.booking_log
    @booking_log.checkout_date_time = DateTime.now
    @booking_log.save

    @twilio_client.messages.create(
      body: "Your cleaner, #{@booking.user.name}, has just checked-out at #{@booking.property.address}. Cleanaroo, always deliver a clean stay",
      from: 'whatsapp:+14155238886',
      to: 'whatsapp:+34634517948'
    )
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
