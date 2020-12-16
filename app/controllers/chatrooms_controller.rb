class ChatroomsController < ApplicationController

  # get all the bookings from the user
  def index
    # cleaner:
    if current_user.role == "cleaner"
      @chatrooms = Chatroom.where(booking: current_user.bookings)
    else
    # prop manager:
      @chatrooms = Chatroom.where(booking: current_user.property_bookings)
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    # select all messages for chatroom that do not belong to current user
    # mark these ones as read

    @messages = Message.where(chatroom: @chatroom)
    @messages.each { |message| message.mark_as_read! for: current_user}
    #exit part in application controller, because the models in there are called on every page
    #whenever user leaves the chatroom >> the messages not belonging to the current user are read
  end

end
