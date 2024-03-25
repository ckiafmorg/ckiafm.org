# frozen_string_literal: true

module ArticlesHelper
  def fmt_article_status(status)
    t("admin.articles.status.#{status}")
  end
end
