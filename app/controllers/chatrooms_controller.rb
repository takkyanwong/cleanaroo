class ChatroomsController < ApplicationController

  # get all the bookings from the user
  def index
    # cleaner:
    if current_user.role == "cleaner"

      @chatrooms = Chatroom.joins(:messages).distinct.where(booking: current_user.bookings).sort_by(&:last_message_time).reverse
    else
    # prop manager:
      @chatrooms = Chatroom.joins(:messages).distinct.where(booking: current_user.property_bookings).sort_by(&:last_message_time).reverse
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

end
