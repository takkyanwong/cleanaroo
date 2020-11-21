class DeleteBookingReferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :booking_tasks, :bookingreferences
  end
end
