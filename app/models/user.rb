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
end
