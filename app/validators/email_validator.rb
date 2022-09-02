# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if email_is_valid? value

    record.errors.add(attribute, :invalid, message: (options[:message] || 'is not a valid'))
  end

  def email_is_valid?(email)
    URI::MailTo::EMAIL_REGEXP.match?(email)
  end
end
