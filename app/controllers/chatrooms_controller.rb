class ChatroomsController < ApplicationController

  def index
    # get all the bookings from the user
    if User.where(role: 1)
      @chatrooms = Chatroom.where(booking: current_user.bookings)
    else
      @chatrooms = Chatroom.where(booking: current_user.booking.property)
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

end
