class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :properties
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :orders
  has_one_attached :photo

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :role, presence: true
  enum role: %i[owner cleaner] #0 & 1

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

 # Filter upcoming current bookings - PM dashboard
  def current_year_pm_bookings
    upcoming_bookings
    pm_yearly_b = upcoming_bookings.select do |booking|
      booking.date >= DateTime.now.beginning_of_year && booking.date <= DateTime.now.end_of_year
    end
    pm_yearly_b.sort_by(&:date)
  end

  def current_month_pm_bookings
    upcoming_bookings
    pm_monthly_b = upcoming_bookings.select do |booking|
      booking.date >= DateTime.now.beginning_of_month && booking.date <= DateTime.now.end_of_month
    end
    pm_monthly_b.sort_by(&:date)
  end

  def current_week_pm_bookings
    upcoming_bookings
    pm_weekly_b = upcoming_bookings.select do |booking|
      booking.date >= DateTime.now.beginning_of_week && booking.date <= DateTime.now.end_of_week
    end
    pm_weekly_b.sort_by(&:date)
  end

  # Filter past bookings - PM dashboard
  def past_bookings_year_pm
    past_bookings
    pm_past_yearly_b = past_bookings.select do |booking|
      booking.date >= DateTime.now.beginning_of_year && booking.date <= DateTime.now.end_of_year
    end
    pm_past_yearly_b.sort_by(&:date).reverse
  end

  def past_bookings_month_pm
    past_bookings
    pm_past_monthly_b = past_bookings.select do |booking|
      booking.date >= DateTime.now.beginning_of_month && booking.date <= DateTime.now.end_of_month
    end
    pm_past_monthly_b.sort_by(&:date).reverse
  end

  def past_bookings_week_pm
    past_bookings
    pm_past_weekly_b = past_bookings.select do |booking|
      booking.date >= DateTime.now.beginning_of_week && booking.date <= DateTime.now.end_of_week
    end
    pm_past_weekly_b.sort_by(&:date).reverse
  end

  # Cleaner dashboard
  def average_rating
    ratings = reviews.pluck(:rating)
    (ratings.sum / ratings.length.to_f).round(1)
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

  def current_week_cleaner_bookings
    upcoming_cleanings
    cleaner_weekly_b = upcoming_cleanings.select do |booking|
      booking.date >= DateTime.now.beginning_of_week && booking.date <= DateTime.now.end_of_week
    end
    cleaner_weekly_b.sort_by(&:date)
  end

  def past_bookings_week_cleaner
    past_cleanings
    cleaner_past_weekly_b = past_cleanings.select do |booking|
      booking.date >= DateTime.now.beginning_of_week && booking.date <= DateTime.now.end_of_week
    end
    cleaner_past_weekly_b.sort_by(&:date).reverse
  end

  def current_week_earnings
    total = current_week_bookings.pluck(:cost)
    total.sum.round
  end

  def current_month_bookings
    bookings.where(date: DateTime.now.beginning_of_month..DateTime.now.end_of_month)
  end

  def current_month_cleaner_bookings
    upcoming_cleanings
    cleaner_monthly_b = upcoming_cleanings.select do |booking|
      booking.date >= DateTime.now.beginning_of_month && booking.date <= DateTime.now.end_of_month
    end
    cleaner_monthly_b.sort_by(&:date)
  end

  def past_bookings_month_cleaner
    past_cleanings
    cleaner_past_monthly_b = past_cleanings.select do |booking|
      booking.date >= DateTime.now.beginning_of_month && booking.date <= DateTime.now.end_of_month
    end
    cleaner_past_monthly_b.sort_by(&:date).reverse
  end

  def current_month_earnings
    total = current_month_bookings.pluck(:cost)
    total.sum.round
  end

  def current_year_bookings
    bookings.where(date: DateTime.now.beginning_of_year..DateTime.now.end_of_year)
  end

  def current_year_cleaner_bookings
    upcoming_cleanings
    cleaner_yearly_b = upcoming_cleanings.select do |booking|
      booking.date >= DateTime.now.beginning_of_year && booking.date <= DateTime.now.end_of_year
    end
    cleaner_yearly_b.sort_by(&:date)
  end

  def past_bookings_year_cleaner
    past_cleanings
    cleaner_past_yearly_b = past_cleanings.select do |booking|
      booking.date >= DateTime.now.beginning_of_year && booking.date <= DateTime.now.end_of_year
    end
    cleaner_past_yearly_b.sort_by(&:date).reverse
  end

  def current_year_earnings
    total = current_year_bookings.pluck(:cost)
    total.sum.round
  end

end

