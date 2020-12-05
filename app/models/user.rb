class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :properties
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :role, presence: true
  enum role: %i[owner cleaner]

  def property_bookings
    bookings = properties.map(&:bookings)
    bookings.flatten
  end

  def upcoming_bookings
    property_bookings
    bookings = property_bookings.select do |booking|
      booking.date > DateTime.now()
    end
    bookings.sort_by(&:date)
  end

  def past_bookings
    property_bookings
    bookings = property_bookings.select do |booking|
      booking.date < DateTime.now()
    end
    bookings.sort_by(&:date).reverse
  end

  def average_rating
    ratings = reviews.pluck(:rating)
    ratings.sum/ratings.length.to_f
  end

end

