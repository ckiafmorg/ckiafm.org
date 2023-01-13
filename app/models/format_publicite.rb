# frozen_string_literal: true

class FormatPublicite
  FORMAT_NAME = %w[banner square vertical].freeze

  class << self
    def all
      @all ||= FORMAT_NAME.map { |format| FormatPublicite.for(format) }
    end

    def for(format_name)
      format = Struct.new(:nom, :hauteur, :largeur)

      case format_name
      when 'banner'
        format.new(format_name, 250, 970)
      when 'square'
        format.new(format_name, 300, 250)
      when 'vertical'
        format.new(format_name, 600, 300)
      else
        raise 'Failed to create the right format'
      end
    end
  end
end
