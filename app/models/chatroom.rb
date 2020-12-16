class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :booking

  def last_message_time
    last_message = messages.order("created_at asc").last
    last_message ? last_message.created_at : nil
    # last_message_time.strftime("%d/%m/%Y")
  end

  # def custom_format(date)
  #     if date == Date.today
  #       "Today"
  #     elsif date == Date.yesterday
  #       "Yesterday"
  #     elsif (created_at > Date.today - 7) && (created_at < Date.yesterday)
  #       created_at.strftime("%A")
  #     else
  #       date.strftime("%B %-d")
  #     end
  # end

end
