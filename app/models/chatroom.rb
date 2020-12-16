class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :booking

  def last_message_time
    messages.order("created_at asc").last.created_at
  end

end
