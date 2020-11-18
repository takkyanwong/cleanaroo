class Task < ApplicationRecord
  has_many :booking_tasks

  validates :title, presence: true
end
