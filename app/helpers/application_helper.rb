# frozen_string_literal: true

module ApplicationHelper
  def format_time(time)
    time.strftime('%H:%M')
  end
end
