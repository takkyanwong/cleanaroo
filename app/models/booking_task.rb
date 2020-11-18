class BookingTask < ApplicationRecord
  belongs_to :task
  belongs_to :booking
end
