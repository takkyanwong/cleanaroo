class AddBookingRefToBookingTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :booking_tasks, :booking, index: true
  end
end
