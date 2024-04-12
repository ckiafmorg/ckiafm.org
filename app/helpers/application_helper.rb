# frozen_string_literal: true

module ApplicationHelper
  def format_time(time)
    time.strftime('%H:%M')
  end

  def format_date(date)
    date.strftime('%Y-%m-%d %H:%M')
  end
end
