class Property < ApplicationRecord
  geocoded_by :address
  belongs_to :user, optional: true

  has_many :bookings
  validates :address, presence: true
  validates :size, presence: true, inclusion: { in: (1..2000) }
  validates :bedroom_count, presence: true, inclusion: { in: (0..2000) }
  validates :bathroom_count, presence: true, inclusion: { in: (0..2000) }
  validates :property_type, presence: true

  after_validation :geocode, if: :will_save_change_to_address?
end
