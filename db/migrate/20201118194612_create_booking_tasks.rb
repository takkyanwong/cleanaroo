class CreateBookingTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_tasks do |t|
      t.references :task, null: false, foreign_key: true
      t.string :bookingreferences

      t.timestamps
    end
  end
end
