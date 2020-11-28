class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, presence: true, inclusion: { in: (1..5) }

  def property_manager_name
    booking.property.user.name
  end
end
