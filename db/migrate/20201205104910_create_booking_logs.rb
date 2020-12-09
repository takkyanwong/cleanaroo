class CreateBookingLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_logs do |t|
      t.references :booking, null: false, foreign_key: true
      t.datetime :checkin_date_time
      t.datetime :checkout_date_time

      t.timestamps
    end
  end
end
