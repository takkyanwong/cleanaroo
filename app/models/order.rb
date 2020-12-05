class Order < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  belongs_to :property
end
