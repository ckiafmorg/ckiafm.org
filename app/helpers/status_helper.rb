# frozen_string_literal: true

module StatusHelper
  def format_status(status)
    css_classes = {
      draft: :warning,
      live: :success,
      published: :success,
      vacation: :info,
      archived: :secondary
    }

    value = t("admin.shared.status.#{status}")
    "<span class=\"badge rounded-pill text-bg-#{css_classes[status.to_sym]}\">#{value}</span>"
  end
end
