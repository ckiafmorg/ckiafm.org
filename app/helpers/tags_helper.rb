# frozen_string_literal: true

module TagsHelper
  def format_tags_list(tags)
    return '' if tags.empty?

    str = ''
    tags.each do |tag|
      if tag == tags.last
        str += tag.nom
      else
        str += "#{tag.nom}, "
      end
    end
    str
  end
end
