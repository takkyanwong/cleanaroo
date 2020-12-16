class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :booking

  def count_unread(user)
    messages.unread_by(user).count
  end
end
