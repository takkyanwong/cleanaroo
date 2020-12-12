class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @past_bookings = current_user.past_bookings
    @upcoming_bookings = current_user.upcoming_bookings
    @current_week_pm_bookings = current_user.current_week_pm_bookings
    @current_month_pm_bookings = current_user.current_month_pm_bookings
    @current_year_pm_bookings = current_user.current_year_pm_bookings
    @past_bookings_year_pm = current_user.past_bookings_year_pm
    @past_bookings_month_pm = current_user.past_bookings_month_pm
    @past_bookings_week_pm = current_user.past_bookings_week_pm
  end

  def match
    @booking = Booking.find(params[:booking_id])
    @booking.property.update(user: current_user)
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        amount: (@booking.cost*100).to_i,
        name: "cleaning",
        currency: 'eur',
        quantity: 1
      }],
      success_url: booking_success_url(@booking), 
      cancel_url: booking_match_url(@booking)
    )
    @booking.update(checkout_session_id: session.id)
  end
  
  def payment
    @booking = Booking.find(params[:booking_id])
  
    redirect_to new_booking_payment_path(@booking)
  end

  #show page to be displayed once paid
  def show
    @booking = current_user.booking.find(params[:booking_id])
  end

  def success
    @booking = Booking.find(params[:booking_id])
  end
end
