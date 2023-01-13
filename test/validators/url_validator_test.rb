# frozen_string_literal: true

require 'test_helper'

class UrlValidable
  include ActiveModel::Validations
  attr_accessor :url

  validates :url, url: true
end

class UrlValidatorTest < ActiveSupport::TestCase
  test "quand url https est valide il n'y a pas d'erreur d'ajoute" do
    validable = UrlValidable.new
    validable.url = 'https://ckiafm.org'

    is_valid = validable.valid?

    assert is_valid
    assert validable.errors[:email].blank?
  end

  test "quand url http est valide il n'y a pas d'erreur d'ajoute" do
    validable = UrlValidable.new
    validable.url = 'http://ckiafm.org'

    is_valid = validable.valid?

    assert is_valid
    assert validable.errors[:email].blank?
  end

  test 'quand url est invalide une erreur est ajoutee' do
    validable = UrlValidable.new
    validable.url = 'invalidurl'

    is_valid = validable.valid?

    assert_not is_valid
    assert_equal I18n.t('validations.url_validator.invalid_url'), validable.errors[:url][0]
  end
end
