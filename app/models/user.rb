class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :properties
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :orders

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :role, presence: true
  enum role: %i[owner cleaner]

  def property_bookings
    bookings = properties.map(&:bookings) # iterating over properties doing property.bookings
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

  def total_earned
    total = bookings.pluck(:cost)
    total.sum.round
  end

  def upcoming_cleanings
    upcoming_b = bookings.select do |booking|
      booking.date > DateTime.now()
    end
    upcoming_b.sort_by(&:date)
  end

  def past_cleanings
    past_b = bookings.select do |booking|
      booking.date < DateTime.now()
    end
    past_b.sort_by(&:date).reverse
  end

  def current_week_bookings
    bookings.where(date: DateTime.now.beginning_of_week..DateTime.now.end_of_week)
  end

  def current_week_earnings
    total = current_week_bookings.pluck(:cost)
    total.sum.round
  end

  def current_month_bookings
    bookings.where(date: DateTime.now.beginning_of_month..DateTime.now.end_of_month)
  end

  def current_month_earnings
    total = current_month_bookings.pluck(:cost)
    total.sum.round
  end

  def current_year_bookings
    bookings.where(date: DateTime.now.beginning_of_year..DateTime.now.end_of_year)
  end

  def current_year_earnings
    total = current_year_bookings.pluck(:cost)
    total.sum.round
  end
end

