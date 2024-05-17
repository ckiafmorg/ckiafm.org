# frozen_string_literal: true

module ApplicationHelper
  def format_time(time)
    # We don't need to display the seconds
    time.to_s[0..-4]
  end

  def format_date(date)
    date.strftime('%Y-%m-%d %H:%M')
  end
end
