module ApplicationHelper
  def pluralize_string(count, string)
    if count > 1 || count == 0
      string.pluralize
    else
      string
    end
  end

  def format_chat_time(date)
    if date >= Date.today
       date.strftime("%H:%M")
    elsif date >= Date.yesterday
      "Yesterday"
    elsif (date > Date.today - 7) && (date < Date.yesterday)
      date.strftime("%A")
    else
      date.strftime("%B %-d")
    end
  end

  def format_message_time(date)
    if date >= Date.today
       "Today at #{date.strftime("%H:%M")}"
    elsif date >= Date.yesterday
      "Yesterday at #{date.strftime("%H:%M")}"
    elsif (date > Date.today - 7) && (date < Date.yesterday)
      date.strftime("%A at %H:%M")
    else
      date.strftime("%B %-d at %H:%M")
    end
  end

end
