class ChatroomsController < ApplicationController

  # get all the bookings from the user
  def index
    # cleaner:
    if current_user.role == "cleaner"
      @chatrooms = Chatroom.joins(:messages).where(booking: current_user.bookings)
    else
    # prop manager:
      @chatrooms = Chatroom.joins(:messages).where(booking: current_user.property_bookings)
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

end
