# frozen_string_literal: true

module SocialMediaAccountHelper
  def social_media_platform_name(sma)
    return sma.nom if sma.nom.present?

    sma.platform.titleize
  end

  def social_media_icon_name(sma)
    return 'rss' if sma.platform == 'podcast'

    sma.platform
  end
end
