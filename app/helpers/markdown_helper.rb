# frozen_string_literal: true

module MarkdownHelper
  def render_markdown(text)
    return if text.blank?

    Kramdown::Document.new(
      MarkdownMedia.parse(text, include_media: true),
      input: :kramdown,
      remove_block_html_tags: false,
      transliterated_header_ids: true
    ).to_html.html_safe # rubocop:disable Rails/OutputSafety
  end
end
