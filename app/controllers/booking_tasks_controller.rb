class BookingTasksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @booking = Booking.find(params[:booking_id])
    @tasks = Task.all
    @booking_task = BookingTask.new
  end

  def create
    booking = Booking.find(params[:booking_id])
    comment = params[:booking_task][:booking][:comment]

    booking.comment = comment unless comment.empty?

    params[:booking_task][:task].delete_at(0)

    tasks = params[:booking_task][:task]
    cost = 0

    tasks.each do |task_title|
      task = Task.find_by(title: task_title)
      BookingTask.create(task: task, booking: booking)
      cost += task.price
    end

    booking.cost = cost
    if booking.save
      redirect_to booking_match_path(booking)
    else
      render :new
    end
  end
end
