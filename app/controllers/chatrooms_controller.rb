class ChatroomsController < ApplicationController

  def index
    # get all the bookings from the user
    @chatrooms = Chatroom.where(booking: current_user.bookings)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

end
