module ApplicationHelper
  def pluralize_string(count, string)
    if count > 1 || count == 0
      string.pluralize
    else
      string
    end
  end
end
