class Property < ApplicationRecord
  belongs_to :user

  has_many :bookings
  validates :address, presence: true
  validates :size, presence: true, inclusion: { in: (1..2000) }
  validates :bedroom_count, presence: true, inclusion: { in: (0..2000) }
  validates :bathroom_count, presence: true, inclusion: { in: (0..2000) }
  validates :property_type, presence: true
end
