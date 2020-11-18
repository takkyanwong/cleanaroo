class Booking < ApplicationRecord
  belongs_to :property
  belongs_to :user

  has_many :booking_tasks
  has_many :tasks, through: :booking_tasks
  has_one :review

  validates :date, presence: true
end
