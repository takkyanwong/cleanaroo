class Booking < ApplicationRecord
  belongs_to :property
  belongs_to :user

  has_many :booking_tasks, dependent: :destroy
  has_many :tasks, through: :booking_tasks
  has_one :review, dependent: :destroy
  has_one :booking_log, dependent: :destroy

  validates :date, presence: true
end
