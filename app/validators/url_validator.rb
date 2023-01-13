# frozen_string_literal: true

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    begin
      uri = URI.parse(value)
      valid = uri.is_a?(URI::HTTP)
    rescue URI::InvalidURIError
      valid = false
    end

    return if valid

    record.errors.add(attribute, :invalid,
                      message: (options[:message] || I18n.t('validations.url_validator.invalid_url')))
  end
end
